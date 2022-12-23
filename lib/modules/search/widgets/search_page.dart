import 'package:brandi/modules/search/search_controller.dart';
import 'package:brandi/service/api_service.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
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
                decoration: InputDecoration(
                  filled: true,
                  //<-- SEE HERE
                  fillColor: HexColor('#ececec'),
                  counterText: '',
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  hintText: '검색어를 입력해주세요.',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  contentPadding: const EdgeInsets.all(20.0),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.searchTxt.clear();
                    },
                    child: const Icon(
                      EvaIcons.closeCircle,
                      color: Colors.grey,
                    ),
                  ),
                ),
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
