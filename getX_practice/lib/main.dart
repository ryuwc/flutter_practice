import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/pages/binding.dart';
import 'package:getx_practice/pages/named/Second.dart';
import 'package:getx_practice/pages/named/first.dart';
import 'package:getx_practice/pages/next.dart';
import 'package:getx_practice/pages/user.dart';
import 'package:getx_practice/src/binding/binding_page.dart';
import 'package:getx_practice/src/controller/count_controller_with_getx.dart';
import 'package:getx_practice/src/controller/dependency_controller.dart';
import 'package:getx_practice/src/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutter Demo',
      // home: Home(),
      initialRoute: "/",
      // routes: {
      //   "/": (context) => Home(),
      //   "/first": (context) => FirstNamedPage(),
      //   "/second": (context) => SecondNamedPage(),
      // },
      getPages: [
        GetPage(name: "/", page: () => Home(), transition: Transition.zoom),
        GetPage(
            name: "/first",
            page: () => FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/second",
            page: () => SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/next", page: () => NextPage(), transition: Transition.zoom),
        GetPage(
            name: "/user/:uid",
            page: () => UserPage(),
            transition: Transition.zoom),
        GetPage(
          name: "/binding",
          page: () => BindingPage(),
          // binding: BindingsBuilder(
          //   () {
          //     Get.lazyPut<CountControllerWithGetX>(
          //         () => CountControllerWithGetX());
          //   },
          // ),
          binding: BindingPageBinding(),
        ),
      ],
    );
  }
}
