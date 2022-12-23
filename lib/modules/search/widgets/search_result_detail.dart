import 'package:brandi/model/image_model.dart';
import 'package:brandi/util/date_formatter.dart';
import 'package:brandi/global_widgets/show_image.dart';
import 'package:brandi/modules/search/search_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultDetail extends GetView<SearchController> {
  SearchResultDetail(this.documents, {super.key});

  late Documents documents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(EvaIcons.arrowheadLeftOutline, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            showImage(context, documents.imageUrl ?? '', 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: '${documents.displaySitename}\n',
                          ),
                          TextSpan(
                            text: dateFormatter('${documents.datetime}'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
