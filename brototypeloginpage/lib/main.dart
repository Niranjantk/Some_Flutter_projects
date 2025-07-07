
import 'package:brototypeloginpage/Login_page/screen_splash.dart';
import 'package:brototypeloginpage/Profile_page_Demo/CardApp.dart';
import 'package:brototypeloginpage/Profile_page_demo2/Profile_page_demo2.dart';
import 'package:brototypeloginpage/Profile_page_youtube/Profile_page_from_youtube.dart';
import 'package:flutter/material.dart';



void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Loginsample",
      theme: ThemeData.dark(),
      home: ScreenSplash(),
    );
  }
}