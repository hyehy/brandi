import 'package:brandi/modules/search/search_controller.dart';
import 'package:brandi/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'serach_result.dart';

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
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Form(
                key: controller.formKey,
                child: TextFormField(
                  maxLength: 10,
                  controller: controller.searchTxt,
                  focusNode: controller.searchNode,
                  decoration: InputDecoration(
                      counterText: '',
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
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.all(20.0),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      )),
                  validator: (val) {
                    if (val!.length < 2) {
                      return '검색어는 2자 이상 입력해주세요.';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    controller.searchEvent(text);
                    print(text);
                  },
                ),
              ),
            ),
          ),
          SearchResult(),
        ],
      ),
    ));
  }
}
