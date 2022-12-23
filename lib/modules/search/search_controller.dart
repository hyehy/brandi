import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../model/image_model.dart';
import '../../service/api_service.dart';

class SearchController extends GetxController {
  var banUserList = <Meta>[].obs;
  var searchNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final TextEditingController searchTxt =
      TextEditingController.fromValue(const TextEditingValue(text: '안녕하세요'));
  var tempTxt = "".obs;
  final api = Get.find<ApiService>();
  var imageList = <Documents>[].obs;
  var sort = Sort.ACCURACY.obs;
  var page = 1;
  var unit = 30;
  var isLoading = false.obs;
  var isEnd = false;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getImageList(searchTxt.text, sort.value, page, unit);
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  _scrollListener() async {
    if (scrollController.offset >=
            scrollController.position.maxScrollExtent - Get.height / 10 &&
        !scrollController.position.outOfRange &&
        !isEnd) {
      ++page;
      await getImageList(searchTxt.text, Sort.ACCURACY, page, unit);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  searchEvent(String txt) {
    if (!formKey.currentState!.validate()) {
      imageList.value = [];
      return;
    }
    Timer(const Duration(milliseconds: 1000), () async {
      isLoading.value = true;

      tempTxt.value = txt;
      if (tempTxt.value == searchTxt.text) {
        page = 1;
        await getImageList(txt, Sort.ACCURACY, page, unit);
      }
      isLoading.value = false;
    });
  }

  Future<void> getImageList(
      String searchTxt, Sort sort, int? page, int? size) async {
    try {
      if (page == 1) isLoading.value = true;
      final data = {
        "query": searchTxt,
        "sort": convertSort(sort),
        "page": page ?? 1,
        "size": size ?? 30
      };

      final res =
          await api.getWithHeader('/v2/search/image', queryParameters: data);
      ImageModel imageModel = ImageModel.fromJson(res.data);
      isEnd = imageModel.meta?.isEnd ?? true;
      if (page == 1) {
        imageList.value = [...imageModel.documents!.map((e) => e).toList()];
      } else {
        imageList.value = [
          ...imageList.value,
          ...imageModel.documents!.map((e) => e).toList()
        ];
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
      print(e);
    }
    isLoading.value = false;
  }
}

enum Sort { ACCURACY, RECENCY }

String convertSort(Sort sort) {
  switch (sort) {
    case Sort.ACCURACY:
      return 'accuracy';
    case Sort.RECENCY:
      return 'recency';
  }
}
