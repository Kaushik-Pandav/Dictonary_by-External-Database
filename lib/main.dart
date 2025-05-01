
import 'package:dictonary/SplashScreen.dart';
import 'package:dictonary/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(Databasehelper());
  runApp(GetMaterialApp(home: Splashscreen()));
}

