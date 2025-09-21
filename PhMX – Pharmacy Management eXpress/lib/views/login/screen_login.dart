import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/common/common_color.dart';
import 'package:parmacy_billing_system/views/forgot_password/forgot_password.dart';
import 'package:parmacy_billing_system/views/navigation/navigation.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CmmonColors.backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// IMAGE with left rounded corners
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

            /// CONTAINER with right rounded corners
            Container(
              width: 600,
              height: 600,
              decoration: const BoxDecoration(
                color: Color(0xFF7322FF),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, left: 60),
                        child: Row(
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'jaro',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              textstylised("Email"),
                              inputs("example@gmail.com", false),

                              SizedBox(height: 20),
                              textstylised("Password"),
                              inputs('Enter you password', true),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPassword(),
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => Navigation(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Text(
                              'LogIn',
                              style: TextStyle(
                                fontSize: 27,
                                fontFamily: 'jaro',
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text textstylised(String content) {
    return Text(
      content,
      style: TextStyle(
        fontFamily: 'jaro',
        fontSize: 16,
        fontWeight: FontWeight.w100,
        color: const Color.fromARGB(255, 246, 246, 246),
      ),
    );
  }

  TextFormField inputs(String hint, bool ob) {
    return TextFormField(
      obscureText: ob,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(86, 159, 145, 173),
        contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
        hint: Text(
          hint,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'jaro',
            color: Color.fromARGB(255, 49, 49, 49),
          ),
        ),
      ),
    );
  }
}
