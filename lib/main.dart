import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pharma_app/controllers/http/http_farmacia_bindings.dart';
import 'package:pharma_app/views/PageListaFarmacias.dart';
import 'package:pharma_app/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => MyHomePageState(), children: [
          GetPage(
            name: '/http',
            page: () => listaFarmaciaState(),
            binding: HttpBindings(),
          )
        ])
      ],
    );
  }
}
