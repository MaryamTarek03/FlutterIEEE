import 'package:flutter_bloc/flutter_bloc.dart';

part 'calc_cubit_state.dart';

class CalcCubit extends Cubit<CalcStates> {
  CalcCubit() : super(CalcStates());

  String firstNum = '', secondNum = '', sign = '';
  double answer = 0;

  static CalcCubit getCalcCubit(context) => BlocProvider.of(context);

  bool checkSign() {
    return sign != '';
  }

  bool isNumber(String s) {
    return double.tryParse(s) != null;
  }

  bool isSign(String char) {
    return (char == '/' || char == '×' || char == '–' || char == '+');
  }

  void evaluate() {
    if (firstNum.isNotEmpty && secondNum.isEmpty) {
      answer = double.parse(firstNum);
      return;
    } else if (firstNum.isEmpty || secondNum.isEmpty) {
      return;
    }
    double first = double.parse(firstNum);
    double second = double.parse(secondNum);
    switch (sign) {
      case '/':
        if (second != 0) {
          answer = first / second;
        }
        break;
      case '×':
        answer = first * second;
        break;
      case '+':
        answer = first + second;
        break;
      case '–':
        answer = first - second;
        break;
    }
  }

  void clear() {
    firstNum = '';
    secondNum = '';
    sign = '';
    answer = 0;
  }

  void backSpace() {
    if (secondNum.isNotEmpty) {
      secondNum = secondNum.substring(0, secondNum.length - 1);
    } else if (sign.isNotEmpty) {
      sign = '';
    } else if (firstNum.isNotEmpty) {
      firstNum = firstNum.substring(0, firstNum.length - 1);
    }
    emit(CalcStates());
  }

  void dot() {
    if (secondNum.isNotEmpty) {
      if (!secondNum.contains('.')) secondNum = '$secondNum.';
    } else if (firstNum.isNotEmpty) {
      if (!firstNum.contains('.')) firstNum = '$firstNum.';
    }
    emit(CalcStates());
  }

  void buttonClick(String char) {
    if (char == 'c') {
      clear();
    } else if (isSign(char) && firstNum.isNotEmpty) {
      sign = char;
    } else if (isNumber(char)) {
      if (char == '0') {
        if (checkSign()) {
          if (secondNum == '0') return;
        }
        if (firstNum == '0') return;
      }
      checkSign() ? secondNum = secondNum + char : firstNum = firstNum + char;
    } else if (char == '<') {
      backSpace();
    } else if (char == '.') {
      dot();
    }
    // ! doesn't work
    else if (sign == '%') {
      if (secondNum.isEmpty) {
        firstNum = (double.parse(firstNum) / 100).toString();
      }
    } else if (char == '=') {
      double x = answer;
      clear();
      firstNum = x.toString();
    }

    evaluate();
    emit(CalcStates());
  }
}
