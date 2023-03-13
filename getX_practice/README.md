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







