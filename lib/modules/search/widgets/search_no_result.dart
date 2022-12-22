import 'package:brandi/modules/search/search_controller.dart';
import 'package:brandi/service/api_service.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchNoResult extends GetView<SearchController> {
  final api = Get.find<ApiService>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height / 3.5,
        ),
        const Icon(
          EvaIcons.fileOutline,
          size: 50,
        ),
        SizedBox(height: Get.height / 50),
        const Text(
          '검색 결과가 없습니다.',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
