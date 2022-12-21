import 'package:brandi/modules/search/search_controller.dart';
import 'package:brandi/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SearchPage extends GetView<SearchController> {
  final api = Get.find<ApiService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10.0)),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: '검색어를 입력해주세요.'.tr,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    suffixIcon: InkWell(
                        onTap: () {
                          api.getJSONData();
                        },
                        child: const Icon(Icons.search, color: Colors.black)),
                  ),
                  // controller: controller.searchTxt,
                  // focusNode: controller.searchNode,
                  onChanged: (text) {
                    // controller.searchEvent(text);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
