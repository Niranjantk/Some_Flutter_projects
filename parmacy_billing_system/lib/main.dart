import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/Login_and_Signin/Screen_login/screen_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenLogin(),
      
    );
  }
}
