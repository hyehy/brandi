import 'package:brandi/modules/search/search_controller.dart';
import 'package:brandi/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'serach_result.dart';

class SearchPage extends GetView<SearchController> {
  SearchPage({super.key});

  final api = Get.find<ApiService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
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
                  hintText: '???????????? ??????????????????.',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  contentPadding: const EdgeInsets.all(20.0),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                validator: (val) {
                  if (val!.length < 2) {
                    return '???????????? 2??? ?????? ??????????????????.';
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
