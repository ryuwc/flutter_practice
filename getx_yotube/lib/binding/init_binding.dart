import 'package:get/get.dart';
import 'package:getx_yotube/controller/app_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }

}