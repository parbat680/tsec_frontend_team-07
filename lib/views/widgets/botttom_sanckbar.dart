import 'package:get/get.dart';
import 'package:flutter/material.dart';

showBottomSnack({required String title, required String message}) {
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
  );
}
