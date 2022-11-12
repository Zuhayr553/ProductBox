import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox/screens/auth_screens/login.dart';
import 'package:productbox/constants/theme_data.dart';
import 'package:productbox/screens/dashboard.dart';
import 'package:productbox/screens/web_socket/websocket.dart';

void main() {
  runApp(MyApp());
}
// Change home to WebSocket() for Screen 4/WebSocket Task.
// Change home to WebSocket() for Screen 4/WebSocket Task.
// Change home to WebSocket() for Screen 4/WebSocket Task.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ProductBox Flutter Exercise',
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      routes: {},
      home: LoginScreen(),
    );
  }
}
