import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/counter_cubit.dart';

class BlocAccessContext extends StatelessWidget {
  const BlocAccessContext({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: "Bloc Access Context",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const BlocAccessContextPage(),
      ),
    );
  }
}

class BlocAccessContextPage extends StatelessWidget {
  const BlocAccessContextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Access Context"),
      ),
      body: Column(
        children: [
          Text(
            "${context.watch<CounterCubit>().state.counter}",
            style: const TextStyle(fontSize: 52),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: const Text(
              "Increament",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
