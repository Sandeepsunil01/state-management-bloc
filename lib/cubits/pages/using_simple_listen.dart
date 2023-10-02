// Simply changing listen to true we can see the update the data
// It is calling setstate
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/cubits/counter/counter_cubit.dart';

class UsingSimpleListen extends StatelessWidget {
  const UsingSimpleListen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}",
        style: const TextStyle(fontSize: 52),
      ),
    );
  }
}
