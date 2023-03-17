import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_yotube/binding/init_binding.dart';
import 'package:getx_yotube/src/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Youtube Clone App',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      initialBinding: InitBinding(),
      getPages: [
        GetPage(
          name: "/",
          page: () => App(),
        )
      ],
    );
  }
}
