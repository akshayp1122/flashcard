import 'package:flutter/material.dart';
import 'package:trogon/screens/all_pages_screen.dart';
// import 'package:trogon/screens/homescreen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trogon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home:  AllPagesScreen(),
    );
  }
}

