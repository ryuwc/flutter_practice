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
  
