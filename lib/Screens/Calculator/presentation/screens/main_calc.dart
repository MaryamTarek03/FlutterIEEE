import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterieee/Screens/Calculator/logic/cubit/calc_cubit.dart';
import 'package:flutterieee/Screens/Calculator/presentation/Widgets/calc_btn.dart';
import 'package:flutterieee/Screens/Calculator/presentation/Widgets/calc_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String myButtons = 'c%</789×456–123+∓0.=';
int buttonsNumber = 20;

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
                          subText: myCubit.firstNum +
                              myCubit.sign +
                              myCubit.secondNum,
                          text: myCubit.answer == myCubit.answer.floor()
                              ? myCubit.answer.toStringAsFixed(0)
                              : myCubit.answer.toStringAsFixed(2),
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
                      itemCount: buttonsNumber,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          BlocConsumer<CalcCubit, CalcStates>(
                        listener: (context, state) => CalcCubit(),
                        builder: (context, state) {
                          CalcCubit myCubit = CalcCubit.getCalcCubit(context);
                          return CalcButton(
                            text: myButtons[index],
                            onPressed: () =>
                                myCubit.buttonClick(myButtons[index]),
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
