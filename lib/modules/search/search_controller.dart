import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/image_model.dart';
import '../../service/api_service.dart';

class SearchController extends GetxController {
  var banUserList = <Meta>[].obs;
  var searchNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final TextEditingController searchTxt =
      TextEditingController.fromValue(const TextEditingValue(text: '브랜디'));
  var tempTxt = "".obs;
  final api = Get.find<ApiService>();
  var imageList = <Documents>[].obs;
  var sort = Sort.ACCURACY.obs;
  var page = 1;
  var unit = 30;

  @override
  void onInit() {
    getImageList(searchTxt.text, sort.value, page, unit);
    super.onInit();
  }

  @override
  void onClose() {
    // final appController = Get.find<AppController>();
    // appController.bottomNavigatiosddssdaadsnLogSetScreen();
    super.onClose();
  }

  searchEvent(String txt) {
    if (!formKey.currentState!.validate()) {
      imageList.value = [];
      return;
    }
    Timer(const Duration(milliseconds: 1000), () async {
      tempTxt.value = txt;
      if (tempTxt.value == searchTxt.text) {
        page = 1;
        await getImageList(txt, Sort.ACCURACY, page, unit);
      }
    });
  }

  Future<void> getImageList(
      String searchTxt, Sort sort, int? page, int? size) async {
    try {
      final data = {
        "query": searchTxt,
        "sort": convertSort(sort),
        "page": page ?? 1,
        "size": size ?? 30
      };
      final res =
          await api.getWithHeader('/v2/search/image', queryParameters: data);
      print(res);
      ImageModel imageModel = ImageModel.fromJson(res.data);
      if (page == 1) {
        imageList.value = [...imageModel.documents!.map((e) => e).toList()];
      } else {
        imageList.value = [
          ...imageList.value,
          ...imageModel.documents!.map((e) => e).toList()
        ];
      }
    } catch (e) {
      print(e);
    }
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
