import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/shared/common_color.dart';
import 'package:parmacy_billing_system/views/Login_and_Signin/screen_login/widgets/input_background.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConnonColors.backgroundColor,
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
