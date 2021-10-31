import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/routes/app_page.dart';
import 'package:pharma_app/app/routes/app_routes.dart';
import 'package:pharma_app/app/theme/app_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'PharmApp',
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
