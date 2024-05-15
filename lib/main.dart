import 'package:flutter/material.dart';
import 'package:lesson36/homepage.dart';
import 'package:lesson36/loginpage.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginpage(),
    );
  }
}
