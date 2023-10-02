import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/counter/counter_bloc.dart';

import '../../previous_page.dart';

class BlocConsumerExample extends StatelessWidget {
  const BlocConsumerExample({super.key});

  @override
  Widget build(context) {
    return BlocConsumer<CounterBloc, CounterState>(
      listener: ((context, state) {
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
      }),
      builder: (context, state) {
        return Center(
          child: Text(
            "${state.counter}",
            style: const TextStyle(fontSize: 52),
          ),
        );
      },
    );
  }
}
