import 'dart:async';

import 'package:brototypeloginpage/Login_page/screen_home.dart';
import 'package:brototypeloginpage/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController name = TextEditingController();

  final TextEditingController password = TextEditingController();

  bool isdatamatch = true;

  final keys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        leading: Icon(null),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: keys,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar( 
                  minRadius: 70,
                  child: Icon(Icons.person,),
                ),
                SizedBox(height: 10,),
                //for user name
                TextFormField(
                
                  controller: name,
                  decoration: InputDecoration(

                    hint: Text('full name'),
                    border: OutlineInputBorder(),
                  ),
                  validator: (_){
                    if(isdatamatch){
                      return null;
                    }
                    else{
                      return 'error';
                    }
                  },
                ),
                SizedBox(height: 10),
                //for password
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text('password'),
                  
                  ),
                  validator: (_){
                    if(isdatamatch){
                      return null;
                    }
                    else{
                      return 'error';
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(visible: !isdatamatch, child: Text('error')),
                    ElevatedButton(
                      onPressed: () {
                        if(keys.currentState!.validate()){
                          check_users(context);
                        }
                        else{
                          print('object');
                        }
                        check_users(context);
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void check_users(BuildContext ctx) async{
    final user = name.text;
    final pass = password.text;
    if (user == pass) {
      final sharedp =await SharedPreferences.getInstance();
      await sharedp.setBool(savekey, true);
      //go to home
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>ScreenHome()));
    } else {
  //     //snack bar
  //     ScaffoldMessenger.of(ctx).showSnackBar(
  //       SnackBar(
  //         margin: EdgeInsets.all(10),
  //         behavior: SnackBarBehavior.floating,
  //         duration: Duration(seconds: 5),
  //         content: Text("Error snackbar"),
  //       ),
  //     );
  //     //material banner
  //     //aleart box
  //     showDialog(
  //       context: ctx,
  //       builder: (ctx) {
  //         return AlertDialog(
  //           title: Text('Error'),
  //           content: Text('Your password and name does\' match'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(ctx).pop();
  //               },
  //               child: Text("Close"),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  // setState((){
  //   isdatamatch = false;
  // });
      
    }
  }
}
