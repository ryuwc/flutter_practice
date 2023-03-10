import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/pages/normal/first.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('라우트 관리 홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return FirstPage();
                //     },
                //   ),
                // );
                Get.to(FirstPage());
              },
              child: Text('일반적인 라우트'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/first");
              },
              child: Text('Named 라우트'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/next", arguments: User("개남자", 32));
              },
              child: Text('Argument 전달'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/user/23857?name=게남&age=23");
              },
              child: Text('동적 url'),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;

  User(this.name, this.age);
}
