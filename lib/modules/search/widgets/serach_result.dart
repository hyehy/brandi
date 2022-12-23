import 'package:brandi/global_widgets/circle_progress.dart';
import 'package:brandi/modules/search/widgets/search_result_detail.dart';
import 'package:brandi/global_widgets/show_image.dart';
import 'package:brandi/modules/search/search_controller.dart';
import 'package:brandi/modules/search/widgets/search_not_found_result.dart';
import 'package:brandi/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResult extends GetView<SearchController> {
  SearchResult({super.key});

  final api = Get.find<ApiService>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? circleProgress()
        : controller.imageList.isEmpty
            ? const SearchNotFoundResult()
            : Expanded(
                child: ListView(
                  controller: controller.scrollController,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    GridView.builder(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      key: PageStorageKey(UniqueKey()),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.imageList.length,
                      //item 개수
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                        mainAxisSpacing: 10, //수평 Padding
                        crossAxisSpacing: 10, //수직 Padding
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        //item 의 반목문 항목 형성
                        return InkWell(
                          onTap: () {
                            Get.to(() => SearchResultDetail(
                                controller.imageList[index]));
                          },
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(14)),
                              child: showImage(
                                  context,
                                  '${controller.imageList[index].thumbnailUrl}',
                                  0)),
                        );
                      },
                    ),
                  ],
                ),
              ));
  }
}
