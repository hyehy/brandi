import 'package:flutter/material.dart';
import 'package:get/get.dart';

Column circleProgress() {
  return Column(
    children: [
      SizedBox(
        height: Get.height / 3.5,
      ),
      const Center(
        child: CircularProgressIndicator(
          strokeWidth: 10,
          backgroundColor: Colors.cyanAccent,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        ),
      ),
    ],
  );
}
