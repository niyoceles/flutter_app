import 'package:flutter/material.dart';

import 'my-home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter app',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        fontFamily: 'Lato',
      ),
      home: const MyHomePage(),
    );
  }
}
