import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterieee/Screens/Counter/CounterCubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(InitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  //variables
  static int count = 0;

  //methods
  void plus() {
    count++;
    emit(PlusState());
  }

  void minus() {
    count--;
    emit(MinusState());
  }
}
