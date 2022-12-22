import 'package:flutter/material.dart';

Center circleProgress() {
  return const Center(
    child: CircularProgressIndicator(
      strokeWidth: 10,
      backgroundColor: Colors.cyanAccent,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
    ),
  );
}
