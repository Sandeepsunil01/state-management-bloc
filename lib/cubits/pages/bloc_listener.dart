// In order to solve above problem we have to use a Bloc Listener and not Bloc builder
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/cubits/counter/counter_cubit.dart';
import 'package:state_management_bloc/previous_page.dart';

class BlocListenerExample extends StatelessWidget {
  const BlocListenerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state.counter == 3) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Counter is ${state.counter}"),
                );
              });
        } else if (state.counter == -1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PreviousPage()));
        }
      },
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Center(
            child: Text(
              "${state.counter}",
              style: const TextStyle(fontSize: 52),
            ),
          );
        },
      ),
    );
  }
}
