import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc_access_routes/bloc_access_generated_routes/generated_route_counter/generated_route_counter_cubit.dart';

class ShowGeneratedCounter extends StatelessWidget {
  const ShowGeneratedCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child:
            BlocBuilder<GeneratedRouteCounterCubit, GeneratedRouteCounterState>(
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
