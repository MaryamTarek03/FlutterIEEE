import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/Calculator/Components/calc_btn.dart';
import 'package:flutterieee/Screens/Calculator/Components/calc_text_field.dart';

List<String> buttons = [
  'C',
  '%',
  'B',
  '/',
  '7',
  '8',
  '9',
  '×',
  '4',
  '5',
  '6',
  '–',
  '1',
  '2',
  '3',
  '+',
  ':)',
  '0',
  '.',
  '=',
];

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: screenWidth * 0.9,
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: CalcTextField(text: '155 × 6'),
                ),
                Expanded(
                  flex: 2,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: buttons.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => CalcButton(
                      text: buttons[index],
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
