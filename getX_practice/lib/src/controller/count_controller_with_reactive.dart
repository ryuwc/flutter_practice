import 'package:get/get.dart';
import 'package:getx_practice/src/controller/count_controller_with_reactive.dart';

enum Num { FIRST, SECOND }

class User {
  String name;
  int age;

  User({required this.name, required this.age});
}

class CountControllerWithReactive extends GetxController {
  RxInt count = 0.obs;
  Rx<Num> nums = Num.FIRST.obs;
  Rx<User> user = User(name: 'John', age: 30).obs;
  RxList<String> names = <String>[].obs;

  void increase() {
    count++;

    user.update((val) {
      val!.name = 'James';
      val.age = 40;
    });

    names.add('James');

    print(user.value.name);
    print(user.value.age);

    print(nums.value);

    print(names);
  }

  void putNumber(int value) {
    count(value);
  }

  @override
  void onInit() {
    ever(count, (callback) => print('매번호출'));
    once(count, (callback) => print('한번만 호출'));
    debounce(count, (callback) => print('마지막 변경에 한번만 호출'),
        time: Duration(seconds: 1));
    interval(count, (callback) => print('변경되고 있는 동안 1초마다 호출'),
        time: Duration(seconds: 1));
    super.onInit();
  }
}
