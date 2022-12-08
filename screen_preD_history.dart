import 'package:diabeat_app_1/screen/screen_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http; //for API connection
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenPreD extends StatefulWidget {
  const ScreenPreD({super.key});

  @override
  State<ScreenPreD> createState() => _ScreenPreDState();
}

Widget _buildRow(List<Widget> widgets) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 24.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgets,
    ),
  );
}

class _ScreenPreDState extends State<ScreenPreD> {
  final _totalDots = 3;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  String getPrettyCurrPosition() {
    return (_currentPosition + 1.0).toStringAsPrecision(3);
  }

  bool? _smokeYes = false;
  bool? _smokeNo = false;
  bool? _drinkYes = false;
  bool? _drinkNo = false;

  String phpurl = "http://192.168.1.40/diabeat_app_1/lib/record.php";

  Future readData() async {
    var res = await http.post(Uri.parse(phpurl), body: {
      // "med_history": _CheckBoxWidgetState.checkedBox,
    });

    var data = jsonDecode(res.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      // _navigateToTerms(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          // padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    'Medical History',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '1. Have you ever been diagnosed, ever been told, or have you had problems with the following?',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CheckBoxWidget(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '2. Do you smoke?',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              RadioButtonSmokeWidget(),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '3. Do you drink alcohol?',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              RadioButtonDrinkWidget(),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '4. Do you exercise regularly?',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text('Yes'),
                value: _drinkYes,
                onChanged: (bool? newValue) {
                  setState(() {
                    _drinkYes = newValue;
                  });
                },
                activeColor: Colors.purple[200],
                checkColor: Colors.white,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text('No'),
                value: _drinkNo,
                onChanged: (bool? newValue) {
                  setState(() {
                    _drinkNo = newValue;
                  });
                },
                activeColor: Colors.purple[200],
                checkColor: Colors.white,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).devicePixelRatio * 5,
                    bottom: MediaQuery.of(context).devicePixelRatio * 8),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          backgroundColor: Color.fromARGB(255, 152, 72, 167),
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10)),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).devicePixelRatio * 7,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void _navigateToTerms(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ScreenDashboard()));
  }
}

class CheckBoxWidget extends StatefulWidget {
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

List checkboxValues = [
  'High Blood Pressure',
  'Eye or Vision Problems',
  'Surgery in the last 5 years',
  'Asthma',
  'Obesity',
  'High Cholesterol/Trilgycerides',
  'Frequent nausea, vomiting, constipation, diarrhea',
  'Heart Disease/Chest Pain',
  'Depression or Anxiety',
  'Shortness of Breath',
  'Kidney/Bladder problems',
  'Thyroid Disease',
  'Circulation problems',
  'Stroke',
  'None',
];

bool newValue = false;
List checkedBox = [];

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: checkboxValues.map((e) {
            // final checked = _CheckBoxWidgetState.checkedBox[]
            return CheckboxListTile(
              title: Text(e),
              value: checkedBox.indexOf(e) < 0 ? false : true,
              onChanged: (newValue) {
                if (checkedBox.indexOf(e) < 0) {
                  setState(() {
                    checkedBox.add(e);
                  });
                } else {
                  setState(() {
                    checkedBox.removeWhere((element) => element == e);
                  });
                  print(checkedBox);
                }
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class RadioButtonSmokeWidget extends StatefulWidget {
  @override
  _RadioButtonSmokeWidgetState createState() => _RadioButtonSmokeWidgetState();
}

class _RadioButtonSmokeWidgetState extends State<RadioButtonSmokeWidget> {
  static var values = <String>[
    'Yes',
    'No',
  ];
  static var selectedValue = values.first;

  final selectedColor = Colors.purple;
  final unselectedColor = Colors.black;

  // String phpurl = "http://192.168.1.40/diabeat_app_1/lib/record.php";

  // Future getValue() async {
  //   var res = await http.post(Uri.parse(phpurl), body: {
  //     "type": _RadioButtonGroupWidgetState.selectedValue,
  //   });
  // }

  @override
  Widget build(BuildContext context) => Container(
        // color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(color: Colors.white),
            buildRadios(),
            Divider(color: Colors.white),
          ],
        ),
      );

  Widget buildRadios() => Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: unselectedColor,
        ),
        child: Column(
          children: values.map(
            (value) {
              final selected =
                  _RadioButtonSmokeWidgetState.selectedValue == value;
              final String newStringValue = selectedValue.toString();
              final color = selected ? selectedColor : unselectedColor;

              return RadioListTile<String>(
                value: value,
                groupValue: selectedValue,
                title: Text(
                  value,
                  style: TextStyle(color: color),
                ),
                activeColor: selectedColor,
                onChanged: (value) => setState(
                  () => _RadioButtonSmokeWidgetState.selectedValue = value!,
                ),
              );
            },
          ).toList(),
        ),
      );
}

class RadioButtonDrinkWidget extends StatefulWidget {
  @override
  _RadioButtonDrinkWidget createState() => _RadioButtonDrinkWidget();
}

class _RadioButtonDrinkWidget extends State<RadioButtonDrinkWidget> {
  static var values = <String>[
    'Yes',
    'No',
  ];
  static var selectedValue = values.first;

  final selectedColor = Colors.purple;
  final unselectedColor = Colors.black;

  // String phpurl = "http://192.168.1.40/diabeat_app_1/lib/record.php";

  // Future getValue() async {
  //   var res = await http.post(Uri.parse(phpurl), body: {
  //     "type": _RadioButtonGroupWidgetState.selectedValue,
  //   });
  // }

  @override
  Widget build(BuildContext context) => Container(
        // color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(color: Colors.white),
            buildRadios(),
            Divider(color: Colors.white),
          ],
        ),
      );

  Widget buildRadios() => Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: unselectedColor,
        ),
        child: Column(
          children: values.map(
            (value) {
              final selected = _RadioButtonDrinkWidget.selectedValue == value;
              final String newStringValue = selectedValue.toString();
              final color = selected ? selectedColor : unselectedColor;

              return RadioListTile<String>(
                value: value,
                groupValue: selectedValue,
                title: Text(
                  value,
                  style: TextStyle(color: color),
                ),
                activeColor: selectedColor,
                onChanged: (value) => setState(
                  () => _RadioButtonDrinkWidget.selectedValue = value!,
                ),
              );
            },
          ).toList(),
        ),
      );
}
