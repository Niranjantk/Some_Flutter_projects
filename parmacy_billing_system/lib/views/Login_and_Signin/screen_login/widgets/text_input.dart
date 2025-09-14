import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/home/home.dart';

//  SIGN IN TEXT=====================================================
class SigninTextandinputs extends StatelessWidget {
  const SigninTextandinputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 60),
          child: Row(
            children: [
              Text(
                'SignIn',
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
        Inputs(),
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        CreateAccountButton(),
      ],
    );
  }
}

//THE text and the  INPUTS SECTIONS =====================================================
class Inputs extends StatelessWidget {
  const Inputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //FIRST

            //SECOND
            SizedBox(height: 20),
            textstylised("Email"),
            inputs("example@gmail.com", false),

            //THIRD
            SizedBox(height: 20),
            textstylised("Password"),
            inputs('Enter you password', true),
            SizedBox(height: 30),
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
        fillColor: Color.fromARGB(86, 159, 145, 173),
        contentPadding: EdgeInsets.only(top: 20, bottom: 20, left: 20),

        border: OutlineInputBorder(
          borderSide: BorderSide(color: const Color.fromARGB(0, 0, 0, 0)),
          borderRadius: BorderRadius.circular(16),
        ),

        hint: Text(
          hint,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'jaro',
            color: const Color.fromARGB(255, 49, 49, 49),
          ),
        ),
      ),
    );
  }
}

//THE CREATE ACCOUNT BUTTON =====================================================
class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
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
    );
  }
}

//THE ALREDY HAVE A ACCOUND OR GOOGLE =====================================================
