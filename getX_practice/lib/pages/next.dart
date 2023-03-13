import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/pages/normal/Second.dart';
import 'package:getx_practice/src/home.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('${Get.arguments['name']} : ${Get.arguments['age']}'),
            Text('${(Get.arguments as User).name}'),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('뒤로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
