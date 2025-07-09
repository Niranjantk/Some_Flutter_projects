import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/Login_and_Signin/Screen_login/elements/input_bk.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF904FFF),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_page_bkimage.png', height: 600),

            BackgroundAndTextInputs(),
          ],
        ),
      ),
    );
  }
}
