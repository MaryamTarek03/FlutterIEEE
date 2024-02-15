import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/BMI%20Calc/bmi_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bmi_calc.dart';
import 'constants.dart';

class BmiLogin extends StatefulWidget {
  const BmiLogin({super.key});

  @override
  State<BmiLogin> createState() => _BmiLoginState();
}

class _BmiLoginState extends State<BmiLogin> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 35,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/Pictures/BmiCalc/house.jpg'),
                    radius: 150,
                    child: Text(
                      'e: maryam@gmail.com\np:1234',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01,
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Text(
                      'SIGN IN',
                      style: GoogleFonts.aDLaMDisplay(
                        fontSize: 50,
                        letterSpacing: 10,
                      ),
                    ),
                  ),
                  const BmiTextField(label: 'Email'),
                  const BmiTextField(label: 'Password'),
                  bmiLoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bmiLoginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            MediaQuery.of(context).size.width * Constants().horizontalPadding,
        vertical:
            MediaQuery.of(context).size.height * Constants().verticalPadding,
      ),
      child: Container(
        height:
            MediaQuery.of(context).size.height * Constants().loginWidgetHeight,
        width: MediaQuery.of(context).size.width * Constants().loginWidgetWidth,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(40),
        ),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BmiCalc(),
                ),
              );
            }
          },
          child: Text(
            'Login',
            style: GoogleFonts.cabin(
              fontSize: 30,
              letterSpacing: 5,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
