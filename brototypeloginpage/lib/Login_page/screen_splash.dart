import 'package:brototypeloginpage/Login_page/screen_login.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotologin();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Image.asset('assets/images/background1.jpg',
      fit: BoxFit.fill,),
      ),
      
    );
  }

  Future <void> gotologin() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).push(MaterialPageRoute(builder: (cxt){
      return ScreenLogin();
    }));
  }
}