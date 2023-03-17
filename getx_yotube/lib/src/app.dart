import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_yotube/controller/app_controller.dart';
import 'package:getx_yotube/res.dart';
import 'package:getx_yotube/src/pages/exprore.dart';
import 'package:getx_yotube/src/pages/home.dart';
import 'package:getx_yotube/src/pages/library.dart';
import 'package:getx_yotube/src/pages/subscribe.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          switch (RouteName.values[controller.currentIndex.value]) {
            case RouteName.Home:
              return Home();
              break;
            case RouteName.Explore:
              return Exprore();
              break;

            case RouteName.Subs:
              return SubScribe();
              break;
            case RouteName.Library:
              return Library();
              break;
          }
          return Container();
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          onTap: (index) {
            print(index);
            controller.changePageIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Res.home_off),
              activeIcon: SvgPicture.asset(Res.home_on),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Res.compass_off,
                width: 22,
              ),
              activeIcon: SvgPicture.asset(
                Res.compass_on,
                width: 22,
              ),
              label: "탐색",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SvgPicture.asset(
                  Res.plus,
                  width: 35,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Res.subs_off),
              activeIcon: SvgPicture.asset(Res.subs_on),
              label: "구독",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Res.library_off),
              activeIcon: SvgPicture.asset(Res.library_on),
              label: "보관함",
            ),
          ],
        ),
      ),
    );
  }
}
