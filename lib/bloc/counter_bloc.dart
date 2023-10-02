import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/counter/counter_bloc.dart';

import 'pages/bloc_builder.dart';
import 'pages/bloc_builder_to_listen_for_changes.dart';
import 'pages/bloc_builders_with_listeners.dart';
import 'pages/bloc_consumer.dart';
import 'pages/extension_method.dart';
import 'pages/using_simple_listener.dart';

class CounterBlocApp extends StatelessWidget {
  const CounterBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Counter Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterBlocHomePage(),
      ),
    );
  }
}

class CounterBlocHomePage extends StatelessWidget {
  const CounterBlocHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BlocExtensionUsage(),
      // body: UsingSimpleListen(),
      // body: BlocBuilderWithBloc(),
      // body: BlocBuilderToChangeInState(),
      body: BlocBuilderWithListeners(),
      // body: BlocConsumerExample(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementCountEvent());
              // Using Extension
              // context.read<CounterBloc>().add(IncrementCountEvent());
            },
            heroTag: "Increment-Tag",
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementCountEvent());
              // Using Extension
              // context.read<CounterBloc>().add(DecrementCountEvent());
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
