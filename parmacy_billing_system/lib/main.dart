import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/Login_and_Signin/screen_sigin/screen_signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSignin(),
      
    );
  }
}
