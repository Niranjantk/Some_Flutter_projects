import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/signin/widgets/texts_inputs.dart';

class BackgroundAndTextInputs extends StatelessWidget {
  const BackgroundAndTextInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 600,
      decoration: const BoxDecoration(
        color: Color(0xFF7322FF),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),

      child: Column(children: [SigninTextandinputs()]),
    );
  }
}
