import 'dart:convert';
import 'dart:io';
import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:real_state_web_app/widgets.dart/map.dart';
import 'package:flutter/widgets.dart';


// ...
// String ACCESS_TOKEN = String.fromEnvironment("ACCESS_TOKEN");
// MapboxOptions.setAccessToken(ACCESS_TOKEN);
// ...
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() async {
    final body = {
      "fullName": {
        "english": <String>["Faisal", "Shabeen"],
        "arabic": ["شعبين", "فيصل"]
      },
      "username": "fe9l",
      "age": "30",
      "govermentalID": "1089036089",
      "birthOfDate": "1994/12/27",
      "email": "fe9lsh3ben@gmail.com"
    };

    final jsonString = json.encode(body);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final dio = Dio();
    try {
      

      

      final response1 = await dio.post('https://127.0.0.1:3050/auth&auth',
          data: jsonString,
          options: Options(headers: headers));
      
      print(response1.data);
      
    } catch (e) {
      print(e);
    } finally{
      dio.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: HomePage(),
      
    );
  }
}
