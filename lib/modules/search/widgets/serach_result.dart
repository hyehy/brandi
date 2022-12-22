import 'package:brandi/modules/search/search_controller.dart';
import 'package:brandi/modules/search/widgets/search_no_result.dart';
import 'package:brandi/service/api_service.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/circle_progress.dart';

class SearchResult extends GetView<SearchController> {
  final api = Get.find<ApiService>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? circleProgress()
        : controller.imageList.isEmpty
            ? SearchNoResult()
            : GridView.builder(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                key: PageStorageKey(UniqueKey()),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.imageList.length,
                //item 개수
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                  mainAxisSpacing: 10, //수평 Padding
                  crossAxisSpacing: 10, //수직 Padding
                ),
                itemBuilder: (BuildContext context, int index) {
                  //item 의 반목문 항목 형성
                  return InkWell(
                    onTap: () {
                      Get.to(() => Scaffold(
                            appBar: AppBar(
                              backgroundColor: Colors.black,
                              leading: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(Icons.close,
                                    color: Colors.white),
                              ),
                            ),
                            body: ListView(
                              children: [
                                Image.network(
                                  controller.imageList[index].imageUrl ?? '',
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                    '${controller.imageList[index].displaySitename}'),
                              ],
                            ),
                          ));
                    },
                    child: Image.network(
                        '${controller.imageList[index].thumbnailUrl}'),
                  );
                },
              ));
  }
}
