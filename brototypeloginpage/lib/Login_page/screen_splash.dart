import 'package:brototypeloginpage/Login_page/screen_home.dart';
import 'package:brototypeloginpage/Login_page/screen_login.dart';
import 'package:brototypeloginpage/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    userlogied();
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
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cxt){
      return ScreenLogin();
    }));
  }
  Future<void> userlogied() async{
    final sharedpre = await SharedPreferences.getInstance();
    final userlogin = sharedpre.getBool(savekey);
    if(userlogin == null || userlogin == false){
      gotologin();
    }
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1)=>ScreenHome()));  
  }
}