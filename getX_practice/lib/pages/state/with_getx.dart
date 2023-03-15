import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/controller/count_controller_with_getx.dart';

class WithGetx extends StatelessWidget {
  const WithGetx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'GetX',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          GetBuilder<CountControllerWithGetX>(
            id: 'first',
            builder: (controller) {
              return Text(
                '${controller.count}',
                style: TextStyle(
                  fontSize: 50,
                ),
              );
            },
          ),
          GetBuilder<CountControllerWithGetX>(
            id: 'second',
            builder: (controller) {
              return Text(
                '${controller.count}',
                style: TextStyle(
                  fontSize: 50,
                ),
              );
            },
          ),
          _button('first'),
          _button('second'),
        ],
      ),
    );
  }

  ElevatedButton _button(String id) {
    return ElevatedButton(
      onPressed: () {
        Get.find<CountControllerWithGetX>().increase(id);
      },
      child: Text(
        '+',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
