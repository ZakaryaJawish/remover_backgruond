// ignore_for_file: unnecessary_null_comparison, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sec_dev/homecontroler/homecontroler.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BG Remover App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Slazar AI App'),
      ),
      body: Center(
        child:
            SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      ElevatedButton(
                child: const Text('pick image'),
                onPressed: () {
                  controller.grtImage();
                }),
                      GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller) {
                  return Center(
                      child: controller.imagebefore == null
                          ? const Text('plz picke image')
                          : Image.file(controller.imagebefore));
                }),
                      ElevatedButton(
                child: const Text('upload image'),
                onPressed: () {
                  controller.uploadImage(controller.imagebefore);
                }),
                      GetBuilder<HomeController>(
              builder: (controller) {
                return Center(
                  child: controller.imagebefore == null
                      ? const Text('plz upload image')
                      : Image.memory(controller.imageafter),
                );
              }
                      )
                    ]),
            ),
      ),
    );
  }
}
