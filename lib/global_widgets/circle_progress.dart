import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

Column circleProgress() {
  return Column(
    children: [
      SizedBox(
        height: Get.height / 3.5,
      ),
      const Center(
        child: SpinKitPumpingHeart(
          color: Colors.blueAccent,
          size: 80,
        ),
      ),
    ],
  );
}
