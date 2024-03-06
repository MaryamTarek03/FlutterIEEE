import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterieee/Screens/Counter/CounterCubit/cubit.dart';
import 'package:flutterieee/Screens/Counter/CounterCubit/states.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<CounterCubit, CounterStates>(
              listener: ((context, state) => CounterCubit()),
              builder: (context, state) {
                CounterCubit cubit = CounterCubit.get(context);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        cubit.minus();
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(CounterCubit.count.toString()),
                    IconButton(
                      onPressed: () {
                        cubit.plus();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                );
              },),
        ),
      ),
    );
  }
}
