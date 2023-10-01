// Bloc builder function will be called in build function and should be a pure function that return a widget in response to the state.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/cubits/counter/counter_cubit.dart';

import '../previous_page.dart';

class BlocBuilderExampleToSeeChanges extends StatelessWidget {
  const BlocBuilderExampleToSeeChanges({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
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
      return Center(
        child: Text(
          "${state.counter}",
          style: const TextStyle(fontSize: 52),
        ),
      );
    });
  }
}
