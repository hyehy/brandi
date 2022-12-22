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
        controller: controller.scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formKey,
              child: TextFormField(
                maxLength: 10,
                controller: controller.searchTxt,
                focusNode: controller.searchNode,
                decoration: const InputDecoration(
                    counterText: '',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    hintText: '검색어를 입력해주세요.',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    contentPadding: EdgeInsets.all(20.0),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
                validator: (val) {
                  if (val!.length < 2) {
                    return '검색어는 2자 이상 입력해주세요.';
                  }
                  return null;
                },
                onChanged: (text) {
                  controller.searchEvent(text);
                },
              ),
            ),
          ),
          SearchResult(),
        ],
      ),
    ));
  }
}
