import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc_access_routes/bloc_access_named_routes/named_route_counter/named_route_counter_cubit.dart';

class ShowNamedCounter extends StatelessWidget {
  const ShowNamedCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: BlocBuilder<NamedRouteCounterCubit, NamedRouteCounterState>(
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
