import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calc_cubit_state.dart';

class CalcCubit extends Cubit<CalcStates> {
  CalcCubit() : super(CalcStates(text: '0'));

  double firstNum = 0, secondNum = 0;

  static CalcCubit getCalcCubit(context) => BlocProvider.of(context);

  bool checkSign() {
    CalcStates(text: '${state.text}1');
    if (state.text.contains('+') ||
        state.text.contains('-') ||
        state.text.contains('*') ||
        state.text.contains('/')) return false;
    return true;
  }

  void add() {
    if (state.text.isNotEmpty) {
      checkSign()
          ? emit(CalcStates(text: '${state.text}+'))
          : emit(CalcStates(
              text: '${state.text.substring(0, state.text.length - 1)}+'));
    }
  }

  void subtract() {
    if (state.text.isNotEmpty) {
      checkSign()
          ? emit(CalcStates(text: '${state.text}-'))
          : emit(CalcStates(
              text: '${state.text.substring(0, state.text.length - 1)}-'));
    }
  }

  void multiply() {
    if (state.text.isNotEmpty) {
      checkSign()
          ? emit(CalcStates(text: '${state.text}*'))
          : emit(CalcStates(
              text: '${state.text.substring(0, state.text.length - 1)}*'));
    }
  }

  void divide() {
    if (state.text.isNotEmpty) {
      checkSign()
          ? emit(CalcStates(text: '${state.text}/'))
          : emit(CalcStates(
              text: '${state.text.substring(0, state.text.length - 1)}/'));
    }
  }

  void clear() {
    emit(CalcStates(text: '0'));
  }

  void backSpace() {
    if (state.text.isNotEmpty && state.text != '0') {
      emit(CalcStates(text: state.text.substring(0, state.text.length - 1)));
    }
  }
}
