import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/cubits/counter/counter_cubit.dart';
import 'pages/bloc_consumer.dart';

class CounterCubitApp extends StatelessWidget {
  const CounterCubitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Counter Cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterCubitHomePage(),
      ),
    );
  }
}

class CounterCubitHomePage extends StatefulWidget {
  const CounterCubitHomePage({super.key});

  @override
  State<CounterCubitHomePage> createState() => _CounterCubitHomePageState();
}

class _CounterCubitHomePageState extends State<CounterCubitHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: UsingSimpleListen(),
      // body: BlocBuilderExample(),
      // body: BlocBuilderExampleToSeeChanges(),
      // body: BlocListenerExample(),
      body: BlocConsumerExample(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              // BlocProvider.of<CounterCubit>(context).increament();
              // Using Extensions
              context.read<CounterCubit>().increament();
            },
            heroTag: "Increment-Tag",
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              // BlocProvider.of<CounterCubit>(context).decrement();
              // Using Extensions
              context.read<CounterCubit>().decrement();
            },
            heroTag: "Decrement-Tag",
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
