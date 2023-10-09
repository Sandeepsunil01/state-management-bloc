import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'anonymous_route_counter/anonymous_route_counter_cubit.dart';

class ShowCounter extends StatelessWidget {
  const ShowCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child:
            BlocBuilder<AnonymousRouteCounterCubit, AnonymousRouteCounterState>(
          builder: (context, state) {
            return Text(
              "${state.counter}",
              style: const TextStyle(fontSize: 52),
            );
          },
        ),
      ),
    );
  }
}
