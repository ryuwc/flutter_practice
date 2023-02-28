# Dart 기본 문법

### 클래스

- 클래스는 객체를 생성하기 위한 틀이다.
- 클래스는 객체의 속성과 행동을 정의한다.

```dart
class Person {
  String name;
  int age;

  void sayHello() {
    print('Hello, my name is $name');
  }
}
```

### 객체

- 객체는 클래스의 인스턴스이다.
- 객체는 속성과 행동을 가진다.

    ```dart
    Person person = new Person();
    person.name = 'John';
    person.age = 20;
    person.sayHello();
    ```

### 생성자

- 생성자는 객체를 생성하기 위한 함수이다.
- 생성자는 클래스 이름과 동일하게 정의한다.

    ```dart
    class Person {
      String name;
      int age;

      // 기본적인 생성자
      Person(this.name, this.age);

      // 네임드 생성자
      Person.fromList(List list) {
        name = list[0];
        age = list[1];
      }
  
      void sayHello() {
        print('Hello, my name is $name');
      }
    }
    ```

### 생성자 사용

- 생성자를 사용하여 객체를 생성한다.

    ```dart
    Person person = new Person('John', 20);
    Person person = Person('John', 20);
    Person person = Person.fromList(['John', 20]);
    ```

### getter, setter

- getter, setter는 속성에 접근할 때 호출되는 함수이다.
- getter는 속성을 가져올 때 호출되는 함수이다.
- setter는 속성을 설정할 때 호출되는 함수이다.

    ```dart
    class Person {
      String name;
      int age;

      Person(this.name, this.age);

      String get getName {
        return name;
      }

      void set setName(String name) {
        this.name = name;
      }
    }
    ```

### getter, setter 사용

- getter, setter를 사용하여 속성에 접근한다.

    ```dart
    Person person = Person('John', 20);
    print(person.getName);
    person.setName = 'Jane';
    ```

- setter를 사용하면 인스턴스 변수를 final로 선언할 수 없어 사용하지 않는 것이 좋다.

    ```dart
    class Person {
      final String name;
      final int age;

      Person(this.name, this.age);

      String get getName {
        return name;
      }
    }
    ```

### 클래스 private

- 클래스의 속성과 행동을 외부에서 접근하지 못하도록 하기 위해 private을 사용한다.
- private은 클래스 내부에서만 접근할 수 있다.
- private은 변수, 함수, 클래스 앞에 `_`를 붙인다.
    ```dart
    class Person {
      String _name;
      int _age;

      Person(this._name, this._age);

      String get getName {
        return _name;
      }

      void set setName(String name) {
        _name = name;
      }
    }
    ```

### 클래스 상속

- 클래스는 상속을 통해 기존 클래스의 속성과 행동을 물려받을 수 있다.
- 상속을 받기 위해서는 `extends` 키워드를 사용한다.

    ```dart
    class Person {
      String name;
      int age;

      Person(this.name, this.age);

      String get getName {
        return name;
      }

      void set setName(String name) {
        this.name = name;
      }
    }

    class Student extends Person {
      Student(String name, int age) : super(name, age);
    }
    ```
- 상속을 받은 클래스는 기존 클래스의 속성과 행동을 사용할 수 있다.

    ```dart
    Student student = Student('John', 20);
    print(student.getName);
    student.setName = 'Jane';
    ```

### 메서드 오버라이드

- method == function, 클래스 내부에 있는 함수
- 메서드 오버라이드는 상속받은 클래스에서 부모 클래스의 메서드를 재정의하는 것이다.
- 메서드 오버라이드는 부모 클래스의 메서드와 동일한 시그니처를 가져야 한다.

    ```dart
    class Person {
      String name;
      int age;

      Person(this.name, this.age);

      String get getName {
        return name;
      }

      void set setName(String name) {
        this.name = name;
      }

      void sayHello() {
        print('Hello, my name is $name');
      }
    }

    class Student extends Person {
      Student(String name, int age) : super(name, age);

      @override
      void sayHello() {
        print('Hello, my name is $name, I am a student');
      }
    }
    ```

### static 키워드

- static 키워드는 클래스 변수와 클래스 메서드를 정의할 때 사용한다.
- 클래스 변수는 클래스의 모든 인스턴스가 공유하는 변수이다.
- 클래스 메서드는 클래스의 모든 인스턴스가 공유하는 메서드이다.

    ```dart
    class Person {
      static const String country = 'Korea';
      static const int age = 20;

      static void sayHello() {
        print('Hello, my name is $country');
      }
    }
    ```
- 클래스 변수와 클래스 메서드는 인스턴스를 생성하지 않고 사용할 수 있다.

    ```dart
    print(Person.country);
    Person.sayHello();
    ```
  
### 추상 클래스

- 추상 클래스는 인스턴스를 생성할 수 없는 클래스이다.


    ```dart
    abstract class Person {
      String name;
      int age;

      Person(this.name, this.age);

      String get getName {
        return name;
      }

      void set setName(String name) {
        this.name = name;
      }

      void sayHello();
    }

    class Student implements Person {
      String name;
      int age;

      Student(this.name, this.age);

      String get getName {
        return name;
      }

      void set setName(String name) {
        this.name = name;
      }

      void sayHello() {
        print('Hello, my name is $name, I am a student');
      }
    }
    ```
- 추상 클래스는 인스턴스를 생성할 수 없기 때문에 `implements` 키워드를 사용하여 인터페이스를 구현한다.


### Generic

- Generic은 클래스나 함수에서 사용할 데이터 타입을 지정하는 것이다.


    ```dart
    class Person<T> {
      T name;
      T age;

      Person(this.name, this.age);

      T get getName {
        return name;
      }

      void set setName(T name) {
        this.name = name;
      }
    }
    ```
- Generic을 사용하여 클래스를 생성할 때 데이터 타입을 지정한다.

    ```dart
    Person<String> person = Person('John', '20');
    print(person.getName);
    person.setName = 'Jane';
    ```
- Generic을 사용하여 함수를 생성할 때 데이터 타입을 지정한다.

    ```dart
    T getPerson<T>(T name, T age) {
      return name;
    }

    String person = getPerson('John', '20');
    print(person);
    ```


  ### 형 변환

- 형 변환은 데이터 타입을 다른 데이터 타입으로 변환하는 것이다.


    ```dart
    int number = 10;
    double doubleNumber = number.toDouble();
    print(doubleNumber);
    ```
- `int`를 `double`로 변환할 때는 `toDouble()`을 사용한다.

    ```dart
    double doubleNumber = 10.5;
    int number = doubleNumber.toInt();
    print(number);
    ```
- `double`을 `int`로 변환할 때는 `toInt()`를 사용한다.

    ```dart
    int number = 10;
    String stringNumber = number.toString();
    print(stringNumber);
    ```
- `int`를 `String`으로 변환할 때는 `toString()`을 사용한다.

    ```dart   
    String stringNumber = '10';
    int number = int.parse(stringNumber);
    print(number);
    ```
- `String`을 `int`로 변환할 때는 `int.parse()`를 사용한다.

    ```dart
    String stringNumber = '10.5';
    double doubleNumber = double.parse(stringNumber);
    print(doubleNumber);
    ```
- `String`을 `double`로 변환할 때는 `double.parse()`를 사용한다.

    ```dart
    int number = 10;
    String stringNumber = number.toString();
    print(stringNumber);
    ```

- List, Set, Map 형 변환

    ```dart
    List<String> list = ['A', 'B', 'C'];
    Set<String> set = list.toSet();
    print(set);
    ```
- `List`를 `Set`으로 변환할 때는 `toSet()`을 사용한다.

    ```dart
    Set<String> set = {'A', 'B', 'C'};
    List<String> list = set.toList();
    print(list);
    ```
- `Set`을 `List`로 변환할 때는 `toList()`를 사용한다.

    ```dart
    List<String> list = ['A', 'B', 'C'];
    Map map = list.asMap();
    print(map);
    ```

- `List`를 `Map`으로 변환할 때는 `asMap()`을 사용한다.

```dart
Map<String, String> map = {'A': 'Apple', 'B': 'Banana', 'C': 'Cherry'};
List<String> list = map.values.toList();
print(list);
```

- `Map`을 `List`로 변환할 때는 `values.toList()`를 사용한다.

```dart
Map<String, String> map = {'A': 'Apple', 'B': 'Banana', 'C': 'Cherry'};
Set<String> set = map.values.toSet();
print(set);
```

- `Map`을 `Set`으로 변환할 때는 `values.toSet()`을 사용한다.

```dart
Set<String> set = {'A', 'B', 'C'};
Map<String, String> map = set.asMap();
print(map);
```

- `Set`을 `Map`으로 변환할 때는 `asMap()`을 사용한다.

### 함수형 프로그래밍(List)

- 함수형 프로그래밍은 함수를 일급 객체로 취급하는 프로그래밍 패러다임이다.


   ```dart
    void main() {
      List<int> list = [1, 2, 3, 4, 5];
      list.map((element) => print(element));
    }
    ```

- `map()`은 `List`의 각 요소를 변환하여 새로운 `List`를 반환한다.


    ```dart
      void main() {
        List<int> list = [1, 2, 3, 4, 5];
        list.where((element) => element % 2 == 0);
      }
      ```
- `where()`는 `List`의 각 요소를 조건에 맞는 요소만 반환한다.


    ```dart
      void main() {
        List<int> list = [1, 2, 3, 4, 5];
        list.any((element) => element % 2 == 0);
      }
      ```
- `any()`는 `List`의 각 요소 중 하나라도 조건에 맞는 요소가 있는지 확인한다.


    ```dart
      void main() {
        List<int> list = [1, 2, 3, 4, 5];
        list.every((element) => element % 2 == 0);
      }
      ```
- `every()`는 `List`의 각 요소가 모두 조건에 맞는 요소인지 확인한다.


    ```dart
      void main() {
        List<int> list = [1, 2, 3, 4, 5];
        list.reduce((value, element) => value + element);
      }
      ```
- `reduce()`는 `List`의 각 요소를 조건에 맞게 합친다.
- `reduce()`는 반환되는 타입이 반드시 `List`의 타입과 같아야 한다.

### 함수형 프로그래밍(Map)

```dart
Map<String, String> map = {'A': 'Apple', 'B': 'Banana', 'C': 'Cherry'};
map.map((key, value) => MapEntry(key, value.toUpperCase()));
```

- `map()`은 `Map`의 각 요소를 변환하여 새로운 `Map`을 반환한다.


### 비동기 처리

- `Future`는 비동기 처리를 위한 클래스이다.


    ```dart
    Future<String> getFuture() {
      return Future.delayed(Duration(seconds: 3), () => 'Hello');
    }

    void main() {
      getFuture().then((value) => print(value));
    }
    ```
- `Future`는 `then()`을 통해 비동기 처리가 완료된 후 실행할 코드를 작성한다.

    ```dart
    Future<String> getFuture() {
      return Future.delayed(Duration(seconds: 3), () => 'Hello');
    }

    void main() {
      getFuture().then((value) => print(value));
      print('World');
    }
    ```
- `then()`은 비동기 처리가 완료된 후 실행되므로 `World`가 먼저 출력된다.