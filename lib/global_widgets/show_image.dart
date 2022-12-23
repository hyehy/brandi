import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget showImage(context, image, padding) {
  return Image.network(
    image,
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) {
        return child;
      }
      return ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: Get.height / 10,
          ),
          Center(
            child: CircularProgressIndicator(
              strokeWidth: 10,
              backgroundColor: Colors.cyanAccent,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        ],
      );
    },
    fit: BoxFit.cover,
    errorBuilder: (context, exception, stackTrace) {
      return Padding(
        padding: EdgeInsets.only(
            top: Get.height * padding / 100,
            bottom: Get.height * padding / 100),
        child: const Icon(
          EvaIcons.imageOutline,
          size: 50,
        ),
      );
    },
  );
}
