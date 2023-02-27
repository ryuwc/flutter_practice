void main() {
  Employee seulgi = Employee('슬기');
  Employee chorong = Employee('초롱');

  seulgi.printNameAndBuilding();
  chorong.printNameAndBuilding();

  Employee.building = '오투타워';

  seulgi.printNameAndBuilding();
  chorong.printNameAndBuilding();
}

class Employee {
  static String? building;
  final String name;

  Employee(this.name);

  void printNameAndBuilding() {
    print('제 이름은 $name 입니다. $building에서 근무하고 있습니다.');
  }

  static void printBuilding() {
    print('저는 $building에서 근무중입니다.');
  }
}
