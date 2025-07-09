import 'package:brototypeloginpage/Login_page/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            signout(context);
          }, icon: Icon(Icons.exit_to_app_rounded))
        ],
        
        
      ),
      body: Center(child: Text('Home'),),
      
    );
  }
  signout(BuildContext ctx)async{
    final sharedp =await SharedPreferences.getInstance();
     await sharedp.clear();
    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>ScreenLogin()),(route)=>false);
  }
}