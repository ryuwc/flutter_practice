import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print('에러발생');
    }
  }

  void fetchData() async {
    Uri url = Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData)['weather'][0]['description'];
      print(myJson);

      var wind = jsonDecode(jsonData)['wind']['speed'];
      print(wind);

      var id = jsonDecode(jsonData)['id'];
      print(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: null,
            child: Text(
              'Get my location',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            )),
      ),
    );
  }
}
