import 'package:flutter/material.dart';
import 'package:nomard_flutter/screens/home_screen.dart';
import 'package:nomard_flutter/services/api_service.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
