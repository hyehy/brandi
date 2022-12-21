import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/image_model.dart';
import '../../service/api_service.dart';

class SearchController extends GetxController {
  var banUserList = <Meta>[].obs;
  var searchTxt = TextEditingController();
  var searchNode = FocusNode();
  final api = Get.find<ApiService>();
  var imageList = <Documents>[].obs;
  var sort = Sort.ACCURACY.obs;
  var page = 1.obs;
  var unit = 3.obs;

  @override
  void onInit() {
    getImageList(searchTxt.text, sort.value, page.value, unit.value);
    super.onInit();
  }

  @override
  void onClose() {
    // final appController = Get.find<AppController>();
    // appController.bottomNavigatiosddssdaadsnLogSetScreen();
    super.onClose();
  }

  searchEvent(String txt) {
    searchTxt.text = txt;
    print(searchTxt.text);
  }

  //
  // searchEvent(String txt) {
  //   Timer(const Duration(milliseconds: 1000), () {
  //     tempTxt.value = txt;
  //     if (tempTxt == searchTxt.text) {
  //       searchTxt1.value = txt;
  //       // mapController.searchTxt.value = txt;
  //     }
  //   });
  // }

  // resetSearchTxt() {
  //   searchTxt1.value = "";
  //   searchTxt.text = "";
  //   // mapController.searchTxt.value = "";
  // }

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
      imageList.value = [...imageModel.documents!.map((e) => e).toList()];
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
