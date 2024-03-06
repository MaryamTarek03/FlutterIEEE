import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterieee/Screens/Calculator/logic/cubit/calc_cubit.dart';
import 'package:flutterieee/Screens/Calculator/presentation/Widgets/calc_btn.dart';
import 'package:flutterieee/Screens/Calculator/presentation/Widgets/calc_text_field.dart';

List<String> buttons = [
  'c',
  '%',
  '<',
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

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CalcCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: BlocConsumer<CalcCubit, CalcStates>(
                      listener: (context, state) => CalcCubit(),
                      builder: (context, state) {
                        CalcCubit myCubit = CalcCubit.getCalcCubit(context);
                        return CalcTextField(
                          text: myCubit.state.text,
                        );
                      },
                    ),
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
                      itemBuilder: (context, index) =>
                          BlocConsumer<CalcCubit, CalcStates>(
                        listener: (context, state) => CalcCubit(),
                        builder: (context, state) {
                          CalcCubit myCubit = CalcCubit.getCalcCubit(context);
                          Function getFunction(String buttonText) {
                            switch (buttonText) {
                              case 'c':
                                return myCubit.clear;
                              case '<':
                                return myCubit.backSpace;
                              case '+':
                                return myCubit.add;
                              case '–':
                                return myCubit.subtract;
                              case '×':
                                return myCubit.multiply;
                              case '/':
                                return myCubit.divide;
                              default:
                                return myCubit.checkSign;
                            }
                          }

                          List<Function> buttonFunctions = [
                            myCubit.clear,
                            myCubit.checkSign,
                            myCubit.backSpace,
                            myCubit.divide,
                            myCubit.checkSign,
                            myCubit.checkSign,
                            myCubit.checkSign,
                            myCubit.multiply,
                            myCubit.checkSign,
                            myCubit.checkSign,
                            myCubit.checkSign,
                            myCubit.subtract,
                            myCubit.checkSign,
                            myCubit.checkSign,
                            myCubit.checkSign,
                            myCubit.add,
                            myCubit.checkSign,
                            myCubit.checkSign,
                            myCubit.checkSign,
                            myCubit.checkSign,
                          ];
                          return CalcButton(
                            text: buttons[index],
                            onPressed: () {
                              buttonFunctions[index]();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
