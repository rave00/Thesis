import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:diabeat_app_1/screen/screen_login.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<SignUpScreen> {
  final email_controller = TextEditingController();
  final pass_controller = TextEditingController();
  final name_controller = TextEditingController();
  final _focus = FocusNode();

  bool _validEmail = false;
  bool _validPass = false;
  bool _validName = false;

  var borderColor = Color.fromARGB(255, 188, 145, 196);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'WELCOME',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(40),
                  child: SizedBox(
                    width: 1 * MediaQuery.of(context).size.width,
                    child: Text(
                      'Kindly fill up the form below to create an account',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                //Text Box Email
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                  child: TextFormField(
                    controller: name_controller,
                    obscureText: true,
                    decoration: InputDecoration(
                        errorText: _validName ? '' : null,
                        errorStyle: _focus.hasFocus
                            ? TextStyle(fontSize: 0, height: 0)
                            : TextStyle(fontSize: 0, height: 0),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: borderColor),
                        ),
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
                        hintText: 'Full Name',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: TextFormField(
                    controller: email_controller,
                    decoration: InputDecoration(
                        errorText: _validEmail ? '' : null,
                        errorStyle: _focus.hasFocus
                            ? TextStyle(fontSize: 0, height: 0)
                            : TextStyle(fontSize: 0, height: 0),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: borderColor),
                        ),
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
                    controller: pass_controller,
                    obscureText: true,
                    decoration: InputDecoration(
                        errorText: _validPass ? '' : null,
                        errorStyle: _focus.hasFocus
                            ? TextStyle(fontSize: 0, height: 0)
                            : TextStyle(fontSize: 0, height: 0),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: borderColor),
                        ),
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
                        hintText: 'Password',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      email_controller.text.isEmpty
                          ? _validEmail = true
                          : _validEmail = false;
                      pass_controller.text.isEmpty
                          ? _validPass = true
                          : _validPass = false;
                      if (email_controller.text.isEmpty) {
                        print('Email is Empty');
                        return null;
                      } else if (pass_controller.text.isEmpty) {
                        print('Pasword is Empty');
                      } else if (name_controller.text.isEmpty) {
                        print("Full Name is Empty");
                      } else {
                        _navigateToNextScreen(context);
                      }
                    });
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
                          TextSpan(text: 'Already have an account?  '),
                          //Clickable Sign-up Text
                          TextSpan(
                              text: 'Sign In Here',
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
      ),
    );
  }

  //void to navigate to next screen (screen_login)
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
