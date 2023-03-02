import 'dart:async';

void main() {
  playAllStream().listen((val) {
    print(val);
  });
}

Stream<int> playAllStream() async* {
  yield* calc(1);
  yield* calc(1000);
}

Stream<int> calc(int num) async* {
  for (int i = 0; i < 5; i++) {
    yield i * num;

    await Future.delayed(Duration(seconds: 1));
  }
}
