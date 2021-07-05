import 'package:flutter/material.dart';
import 'package:test_task_flutter/Pages/home_page.dart';
import 'package:test_task_flutter/Pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => LoginPage(),
        '/home_page': (context) => HomePage(),
      },
    );
  }
}
