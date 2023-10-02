// We can use BlocBuilder in order to see the changes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/cubits/counter/counter_cubit.dart';

class BlocBuilderExample extends StatelessWidget {
  const BlocBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
      return Center(
        child: Text(
          "${state.counter}",
          style: const TextStyle(fontSize: 52),
        ),
      );
    });
  }
}
