import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController name = TextEditingController();

  final TextEditingController password = TextEditingController();

  bool isdatamatch = true;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //for user name
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hint: Text('full name'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              //for password
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hint: Text('password'),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(visible: !isdatamatch, child: Text('error')),
                  ElevatedButton(
                    onPressed: () {
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
    );
  }

  void check_users(BuildContext ctx) {
    final user = name.text;
    final pass = password.text;
    if (user == pass) {
      //go to home
    } else {
      //snack bar
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 5),
          content: Text("Error snackbar"),
        ),
      );
      //material banner
      //aleart box
      showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Your password and name does\' match'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Close"),
              ),
            ],
          );
        },
      );
  setState((){
    isdatamatch = false;
  });
      
    }
  }
}
