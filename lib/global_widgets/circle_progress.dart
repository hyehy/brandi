import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

Column circleProgress() {
  return Column(
    children: [
      SizedBox(
        height: Get.height / 3.5,
      ),
      Center(child: SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.blueAccent,
            ),
          );
        },
      )),
    ],
  );
}
