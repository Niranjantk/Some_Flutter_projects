import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/common/common_color.dart';
import 'package:parmacy_billing_system/views/signin/screen_signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: CmmonColors.backgroundColor
      ),
      debugShowCheckedModeBanner: false,
      home: ScreenSignin(),
      
    );
  }
}
