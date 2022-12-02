import 'package:flutter/material.dart';

import 'Screens/Post_Screen.dart';
import 'Screens/Users_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zigy',
      theme: ThemeData(

        primarySwatch: Colors.yellow,
      ),
      home: const UsersScreen(),
    );
  }
}
