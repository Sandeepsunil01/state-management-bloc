import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/counter/counter_bloc.dart';

class BlocBuilderWithBloc extends StatelessWidget {
  const BlocBuilderWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
      return Center(
        child: Text(
          "${state.counter}",
          style: const TextStyle(fontSize: 52),
        ),
      );
    });
  }
}
