import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/common/common_color.dart';
import 'package:parmacy_billing_system/views/signin/widgets/input_bakcground.dart';

class ScreenSignin extends StatelessWidget {
  const ScreenSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CmmonColors.backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/images/login_page_bkimage.png',
                height: 600,
              ),
            ),

            BackgroundAndTextInputs(),
          ],
        ),
      ),
    );
  }
}
