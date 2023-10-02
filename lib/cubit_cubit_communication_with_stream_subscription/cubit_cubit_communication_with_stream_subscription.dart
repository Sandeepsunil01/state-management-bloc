import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/cubit_cubit_communication_with_stream_subscription/cubits/color/color_cubit.dart';
import 'package:state_management_bloc/cubit_cubit_communication_with_stream_subscription/cubits/counter/counter_cubit.dart';

class CubitToCubitCommunicationWithStreamSubscription extends StatelessWidget {
  const CubitToCubitCommunicationWithStreamSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    // Using cascading the Bloc Providers
    // return BlocProvider<ColorCubit>(
    //   create: (context) => ColorCubit(),
    //   child: BlocProvider<CounterCubit>(
    //     create: (context) => CounterCubit(
    //       // Two methods to access the Color Cubit as Counter Cubit has the required parameter color cubit
    //       colorCubit: context.read<ColorCubit>(), //Using extension metod
    //       // Or Use Multi Bloc Provider
    //     ),
    //     child: MaterialApp(
    //       title: "Bloc & Cubit",
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData.light(useMaterial3: true),
    //       home: const BlocAndCubitPage(),
    //     ),
    //   ),
    // );

    // Using MultiBlocProvider
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        BlocProvider<CounterCubit>(
            create: (context) =>
                CounterCubit(colorCubit: context.read<ColorCubit>()))
      ],
      child: MaterialApp(
        title: "Cubit Cubit Stream",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        home: const CubitToCubitCommunicationWithStreamSubscriptionPage(),
      ),
    );
  }
}

class CubitToCubitCommunicationWithStreamSubscriptionPage
    extends StatelessWidget {
  const CubitToCubitCommunicationWithStreamSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: context.watch<ColorCubit>().state.color,
          title: const Text(
            "Cubit Cubit with StreamSubscription",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<ColorCubit>().changeColor();
            },
            child: const Text(
              "Change Color",
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "${context.watch<CounterCubit>().state.counter}",
            style: const TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<CounterCubit>().changeCounter();
            },
            child: const Text(
              "Increment Counter",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      )),
    );
  }
}
