# getX 정리

## 페이지 이동

### Get.to()



```dart
Get.to(NextPage());
```

- Get.to()는 기본적으로 페이지 이동을 할 때 사용하는 메소드이다.



```dart
Get.back();
```

- Get.back()는 기본적으로 페이지를 뒤로 이동할 때 사용하는 메소드이다.



```dart
Get.offAll(Home());
```

- Get.offAll()은 기존의 모든 페이지를 지우고 새로운 페이지로 이동할 때 사용하는 메소드이다.


### named route


```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutter Demo',
      // home: Home(),
      getPages: [
        GetPage(name: "/", page: () => Home()),
        GetPage(name: "/first", page: () => FirstNamedPage()),
        GetPage(name: "/second", page: () => SecondNamedPage()),
      ],
    );
  }
}
```

- GetMaterialApp의 getPages 속성에 GetPage를 사용하여 페이지를 등록한다.



```dart
Get.toNamed("/first");
```

- Get.toNamed()는 기본적으로 페이지 이동을 할 때 사용하는 메소드이다.



```dart
Get.offNamed("/second");
```

- Get.offNamed()는 현재 페이지를 지우고 새로운 페이지로 이동할 때 사용하는 메소드이다.



```dart
Get.offAllNamed("/");
```

- Get.offAllNamed()는 기존의 모든 페이지를 지우고 새로운 페이지로 이동할 때 사용하는 메소드이다.
- 홈으로 이동할 때 사용한다.


```dart
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
      ],
```

- GetPage의 transition 속성을 사용하여 페이지 이동 시 애니메이션을 설정할 수 있다.


### Arguments 전달


```dart
Get.toNamed("/next", arguments: User("개남자", 32));

class User {
  String name;
  int age;

  User(this.name, this.age);
}
```

- Get.toNamed()의 arguments 속성을 사용하여 페이지 이동 시 데이터를 전달할 수 있다.
- String, int, map, class 등 어떤 데이터라도 전달할 수 있다.



```dart
// 동적 라우팅 보내기
GetPage(name: "/user/:uid", page: () => UserPage()),

Get.toNamed("/user/23857?name=게남&age=23");

// 동적 라우팅 받기

Get.parameters["uid"]; // 23857
Get.parameters["name"]; // 게남
Get.parameters["age"]; // 23
```


- GetPage의 name 속성에 :uid와 같이 동적 라우팅을 설정할 수 있다.
- 또한, Get.toNamed()의 arguments 속성에 ?name=게남&age=23와 같이 쿼리스트링을 사용하여 데이터를 전달할 수 있다.



## 상태 관리

### 단순 상태 관리



```dart
// count_controller.dart
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CountControllerWithGetX extends GetxController {
  int count = 0;

  void increase(String id) {
    count++;
    update([id]);
  }
}
```


```dart
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
```

- GetBuilder를 사용하여 상태를 관리할 수 있다.
- GetBuilder의 id 속성을 사용하여 특정 상태만 관리할 수 있다.


### 반응형 상태 관리


```dart
// count_controller.dart
import 'package:get/get.dart';

class CountControllerWithReactive {
  RxInt count = 0.obs;

  void increase() {
    count++;
  }
}
```

- RxInt, RxString, RxList 등의 타입을 사용하여 상태를 관리할 수 있다.



```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/pages/state/with_getx.dart';
import 'package:getx_practice/pages/state/with_provider.dart';
import 'package:getx_practice/src/controller/count_controller_with_getx.dart';
import 'package:getx_practice/src/controller/count_controller_with_provider.dart';
import 'package:getx_practice/src/controller/count_controller_with_reactive.dart';
import 'package:provider/provider.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithReactive());

    return Scaffold(
      appBar: AppBar(
        title: Text('반응형 상태관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GetX',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Obx(
              () => Text(
                '${Get.find<CountControllerWithReactive>().count.value}',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<CountControllerWithReactive>().increase();
              },
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```

- Obx를 사용하여 상태를 관리할 수 있다.



```dart
@override
  void onInit() {
    ever(count, (callback) => print('매번호출'));
    once(count, (callback) => print('한번만 호출'));
    debounce(count, (callback) => print('마지막 변경에 한번만 호출'),
        time: Duration(seconds: 1));
    super.onInit();
  }
```

- ever, once, debounce 등의 메서드를 사용하여 상태가 변경될 때 특정 메서드를 호출할 수 있다.


### 의존성 주입


```dart
ElevatedButton(
  onPressed: () {
    Get.to(
      GetPut(),
      binding: BindingsBuilder(() {
        Get.put(DependencyController());
      }),
    );
  },
  child: Text("GetPut"),
),
```

- Get.to()의 binding 속성을 사용하여 의존성 주입을 할 수 있다.



```dart
ElevatedButton(
  onPressed: () {
    Get.to(
      GetPut(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DependencyController());
      }),
    );
  },
  child: Text("GetPut"),
),
```

- Get.lazyPut()을 사용하여 의존성 주입을 할 수 있다.
- lazyPut은 Get.find()를 사용하여 의존성을 찾을 때만 의존성을 주입한다.



```dart
ElevatedButton(
  onPressed: () {
    Get.to(
      GetPut(),
      binding: BindingsBuilder(() {
        Get.putAsync(() => DependencyController());
      }),
    );
  },
  child: Text("GetPut"),
),
```

- Get.putAsync()를 사용하여 비동기적으로 의존성을 주입할 수 있다.



```dart
ElevatedButton(
  onPressed: () {
    Get.to(
      GetPut(),
      binding: BindingsBuilder(() {
        Get.create(() => DependencyController());
      }),
    );
  },
  child: Text("GetPut"),
),
```

- Get.create()를 사용하여 의존성을 주입할 수 있다.
- create는 의존성을 주입할 때마다 새로운 인스턴스를 생성한다.


