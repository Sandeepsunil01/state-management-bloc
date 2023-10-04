import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/counter_cubit.dart';

class BlocAccessContext extends StatelessWidget {
  const BlocAccessContext({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc Access Context",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const BlocAccessContextPage(),
    );
  }
}

// If you want to access the cubit inside a child widget there are 2 methods
// 1. Use Child Widget
// 2. Use builder widget
class BlocAccessContextPage extends StatelessWidget {
  const BlocAccessContextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Access Context"),
      ),
      // 1. Method one using extracting child widget
      // body: BlocProvider<CounterCubit>(
      //   create: (_) => CounterCubit(),
      //   child: const ChildWidget(),
      // ),

      // 2. Using Builder Method
      body: BlocProvider<CounterCubit>(
        create: (_) => CounterCubit(),
        child: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    "Increment",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              "Increment",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
