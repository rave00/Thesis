import 'package:diabeat_app_1/screen/screen_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenTerms extends StatelessWidget {
  const ScreenTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 45,
                    left: MediaQuery.of(context).devicePixelRatio * 10,
                    right: MediaQuery.of(context).devicePixelRatio * 10),
                child: Text(
                  "For the final part of the assessment, we would like you to be informed that this application is here solely to assist you in monitoring and managing your condition and does not mean that you have completely rely on the lifestyle recommendation we have for you. We strictly advise you that while using this application, it is still necessary to keep your session with your doctors along with your insulin and medication.",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).devicePixelRatio * 8,
                      height: MediaQuery.of(context).devicePixelRatio * 0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                    MediaQuery.of(context).devicePixelRatio * 10),
                child: Text(
                  "By clicking submit button, you are automatically agreeing to this condition.",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).devicePixelRatio * 8,
                      height: MediaQuery.of(context).devicePixelRatio * 0.5),
                ),
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    _navigateToTerms(context);
                  },
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      backgroundColor: Color.fromARGB(255, 152, 72, 167),
                      primary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).devicePixelRatio * 7),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  void _navigateToTerms(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ScreenDashboard()));
  }
}
