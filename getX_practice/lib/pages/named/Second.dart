import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/home.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Named Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('뒤로 이동'),
            ),
            ElevatedButton(
              onPressed: () {
                // Get.to(Home());
                Get.offAllNamed("/");
              },
              child: Text('홈으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
