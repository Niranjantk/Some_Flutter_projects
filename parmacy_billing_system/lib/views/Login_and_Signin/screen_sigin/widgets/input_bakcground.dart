import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/Login_and_Signin/screen_sigin/widgets/texts_inputs.dart';

class BackgroundAndTextInputs extends StatelessWidget {
  const BackgroundAndTextInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 600,
      decoration: BoxDecoration(
        color: Color(0xFF7322FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [SigninTextandinputs()]),
    );
  }
}
