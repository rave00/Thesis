import 'package:diabeat_app_1/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScreenDashboard extends StatelessWidget {
  ScreenDashboard({super.key});

  var __align = MainAxisAlignment.start;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      drawer: NavDrawer(),
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).devicePixelRatio * 50),
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: AppBar(
            title: IconButton(
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                  //close drawer, if drawer is open
                } else {
                  scaffoldKey.currentState!.openDrawer();
                  //open drawer, if drawer is closed
                }
              },
              icon: Icon(FontAwesomeIcons.bars),
            ),
            backgroundColor: Colors.grey,
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            titleSpacing: 0,
          ),
        ),
      ),

      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
