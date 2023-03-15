import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CountControllerWithGetX extends GetxController {
  static CountControllerWithGetX get to => Get.find();
  int count = 0;
  RxInt count2 = 0.obs;

  void increase(String id) {
    count++;
    count2++;
    update([id]);
    update();
  }
}
