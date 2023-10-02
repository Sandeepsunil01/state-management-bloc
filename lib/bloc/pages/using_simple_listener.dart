import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter/counter_bloc.dart';

class UsingSimpleListen extends StatelessWidget {
  const UsingSimpleListen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${BlocProvider.of<CounterBloc>(context, listen: true).state.counter}",
        style: const TextStyle(fontSize: 52),
      ),
    );
  }
}
