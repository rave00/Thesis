import 'package:diabeat_app_1/screen/screen_assess.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:diabeat_app_1/screen/screen_signup.dart';
import 'package:diabeat_app_1/screen/screen_assess.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: 1 * MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                //Logo
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(255, 188, 145, 196),
                    child: Text(
                      'Logo',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(children: [
              //Welcome Text
              Align(
                alignment: Alignment.center,
                child: Text(
                  'WELCOME BACK!',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //Sign-In Text
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //Text Box Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 188, 145, 196),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color.fromARGB(255, 188, 145, 196),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red)),
                      hintText: 'Email',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
                ),
              ),
              //Text Box Password
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 188, 145, 196),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color.fromARGB(255, 188, 145, 196),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red)),
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
                ),
              ),
              //Login Button
              ElevatedButton(
                onPressed: () {
                  _navigateToAssessScreen(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Color.fromARGB(255, 169, 140, 174),
                    ),
                  ),
                  elevation: 12.0,
                  shadowColor: Colors.transparent,
                  primary: Color.fromARGB(255, 169, 140, 174),
                  minimumSize: const Size(150, 50),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              //Text Question below
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        TextSpan(text: 'Does not have account yet?  '),
                        //Clickable Sign-up Text
                        TextSpan(
                            text: 'Sign Up Here',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 169, 140, 174),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _navigateToNextScreen(
                                    context); //OnTap, the screen will transfer to screen_signup
                              })
                      ]),
                ),
              ),
            ]),
          ),
        ],
      )),
    );
  }

  //void to navigate to next screen (screen_signup)
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
  }

  void _navigateToAssessScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AssessmentScreen()));
  }
}
