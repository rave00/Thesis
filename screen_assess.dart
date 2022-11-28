// import 'dart:ui';
// import 'dart:math';
// import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

enum radioOptions { dInsipidus, dMellType1, dMellType2, Gestational, pDiabetes }

class _AssessmentScreenState extends State<AssessmentScreen> {
  final date_controller = TextEditingController();
  final weight_controller = TextEditingController();
  final height_controller = TextEditingController();
  bool _validateDate = false;
  bool _validWeight = false;
  bool _validHeight = false;

  final _focus = FocusNode();

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

  @override
  void initState() {
    super.initState();
    date_controller.text = "";
  } //function for date picker to change value of textbox

  Widget _buildRow(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  } //For Dot Indicator

  String getPrettyCurrPosition() {
    return (_currentPosition + 1.0).toStringAsPrecision(3);
  } //For Dot Indicator

  //For DropDown values
  String iniSex = "Female";
  var sex = ["Female", "Male"];

  var borderColor = Color.fromARGB(255, 188, 145, 196);
  radioOptions? _options =
      radioOptions.dInsipidus; //default selection in radio buttons

  @override
  Widget build(BuildContext context) {
    final decorator = DotsDecorator(
      activeColor: Colors.white,
      size: Size.square(15.0),
      activeSize: Size.square(35),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: 1 * MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 15),
                  child: Text(
                    '  Tell me about yourself.',
                    style: TextStyle(
                        // fontSize: 15,
                        fontSize: MediaQuery.of(context).devicePixelRatio * 8.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    // textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).devicePixelRatio * 60,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40, left: 30),
                      child: TextFormField(
                        controller: date_controller,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Birthday",
                          hintText: "MM-dd-yyyy",
                          errorText: _validateDate ? '' : null,
                          errorStyle: _focus.hasFocus
                              ? TextStyle(fontSize: 0, height: 0)
                              : TextStyle(fontSize: 0, height: 0),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).devicePixelRatio * 7,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: borderColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: borderColor,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: borderColor),
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1901),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('MM-dd-yyyy').format(pickedDate);

                            setState(() {
                              date_controller.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: MediaQuery.of(context).devicePixelRatio * 50.0,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Gender",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context)
                                            .devicePixelRatio *
                                        7),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: borderColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: borderColor,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: borderColor))),
                            value: iniSex,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: sex.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                iniSex = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 1 * MediaQuery.of(context).size.width,
            child: Row(children: [
              Row(
                children: [
                  SizedBox(
                    width: 1 * MediaQuery.of(context).devicePixelRatio * 60,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                            controller: weight_controller,
                            focusNode: _focus,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              hintText: 'Kilograms',
                              hintStyle: TextStyle(fontWeight: FontWeight.w500),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Weight",
                              errorText: _validWeight ? '' : null,
                              errorStyle: _focus.hasFocus
                                  ? TextStyle(fontSize: 0, height: 0)
                                  : TextStyle(fontSize: 0, height: 0),
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).devicePixelRatio *
                                          7,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: borderColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: borderColor,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: borderColor)),
                            ),
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(7),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.]')),
                            ]),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 50, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: MediaQuery.of(context).devicePixelRatio * 60,
                            child: TextFormField(
                                controller: height_controller,
                                decoration: InputDecoration(
                                  hintText: 'Inches (e.g. 4"1)',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelText: "Height",
                                  errorText: _validHeight ? '' : null,
                                  errorStyle: _focus.hasFocus
                                      ? TextStyle(fontSize: 0, height: 0)
                                      : TextStyle(fontSize: 0, height: 0),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          7),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(width: 3, color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: borderColor)
                                      // BorderSide.none,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: borderColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: borderColor),
                                  ),
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(7),
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9"]'),
                                  ),
                                ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ]),
          ),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 8),
                  child: Text(
                    "What type of diabetes do you have?",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).devicePixelRatio * 7,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).devicePixelRatio * 136,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: borderColor, width: 2)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('Diabetes Insipidus',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              6)),
                                  leading: Radio<radioOptions>(
                                    value: radioOptions.dInsipidus,
                                    groupValue: _options,
                                    onChanged: (radioOptions? value) {
                                      setState(() {
                                        _options = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Diabetes Mellitus Type 1',
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                .devicePixelRatio *
                                            6),
                                  ),
                                  leading: Radio<radioOptions>(
                                    value: radioOptions.dMellType1,
                                    groupValue: _options,
                                    onChanged: (radioOptions? value) {
                                      setState(() {
                                        _options = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text('Diabetes Mellitus Type 2',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              6)),
                                  leading: Radio<radioOptions>(
                                    value: radioOptions.dMellType2,
                                    groupValue: _options,
                                    onChanged: (radioOptions? value) {
                                      setState(() {
                                        _options = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text('Gestational',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              6)),
                                  leading: Radio<radioOptions>(
                                    value: radioOptions.Gestational,
                                    groupValue: _options,
                                    onChanged: (radioOptions? value) {
                                      setState(() {
                                        _options = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text('Pre-Diabetes',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              6)),
                                  leading: Radio<radioOptions>(
                                    value: radioOptions.pDiabetes,
                                    groupValue: _options,
                                    onChanged: (radioOptions? value) {
                                      setState(() {
                                        _options = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding:
                EdgeInsets.all(MediaQuery.of(context).devicePixelRatio * 20),
            child: Column(
              children: [
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Color.fromARGB(255, 152, 72, 167),
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ],
            ),
          ),
          //Button
          SizedBox(
            width: MediaQuery.of(context).devicePixelRatio * 320,
            height: MediaQuery.of(context).devicePixelRatio * 20,
            child: Padding(
              padding: EdgeInsets.only(right: 40),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).devicePixelRatio * 7,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        date_controller.text.isEmpty
                            ? _validateDate = true
                            : _validateDate = false;
                        weight_controller.text.isEmpty
                            ? _validWeight = true
                            : _validWeight = false;
                        height_controller.text.isEmpty
                            ? _validHeight = true
                            : _validHeight = false;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
