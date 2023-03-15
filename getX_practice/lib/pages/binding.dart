import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/controller/count_controller_with_getx.dart';

class BindingPage extends GetView<CountControllerWithGetX> {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // GetBuilder<CountControllerWithGetX>(
          //   builder: (controller) {
          //     return Text(
          //       controller.count2.toString(),
          //     );
          //   },
          // ),
          Obx(() => Text(controller.count2.toString())),
          ElevatedButton(
            onPressed: () {
              // CountControllerWithGetX.to.increase('frist');
              controller.increase('first');
            },
            child: Text(""),
          )
        ],
      ),
    );
  }
}
