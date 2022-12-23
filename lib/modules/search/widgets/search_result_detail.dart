import 'package:brandi/model/image_model.dart';
import 'package:brandi/util/date_formatter.dart';
import 'package:brandi/global_widgets/show_image.dart';
import 'package:brandi/modules/search/search_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultDetail extends GetView<SearchController> {
  late Documents documents;

  SearchResultDetail(this.documents, {super.key});

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
                  Text(
                    '${documents.displaySitename}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 8,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    dateFormatter('${documents.datetime}'),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
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
