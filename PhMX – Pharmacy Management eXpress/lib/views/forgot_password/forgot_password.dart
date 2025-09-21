import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/common/common_color.dart';
import 'package:parmacy_billing_system/views/forgot_password/widgets/input_background.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CmmonColors.backgroundColor,
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
