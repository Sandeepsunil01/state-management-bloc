import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/cubit_cubit_communication_with_bloc_listeners/cubits/color/color_cubit.dart';
import 'package:state_management_bloc/cubit_cubit_communication_with_bloc_listeners/cubits/counter/counter_cubit.dart';

class CubitToCubitCommunicationWithBlocListener extends StatelessWidget {
  const CubitToCubitCommunicationWithBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        title: "Cubit Cubit BlocListener",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const CubitToCubitCommunicationWithBlocListenerPage(),
      ),
    );
  }
}

class CubitToCubitCommunicationWithBlocListenerPage extends StatefulWidget {
  const CubitToCubitCommunicationWithBlocListenerPage({super.key});

  @override
  State<CubitToCubitCommunicationWithBlocListenerPage> createState() =>
      _CubitToCubitCommunicationWithBlocListenerPageState();
}

class _CubitToCubitCommunicationWithBlocListenerPageState
    extends State<CubitToCubitCommunicationWithBlocListenerPage> {
  int incrementSize = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementSize = 1;
        } else if (state.color == Colors.green) {
          incrementSize = 10;
        } else if (state.color == Colors.blue) {
          incrementSize = 100;
        } else if (state.color == Colors.black) {
          context.read<CounterCubit>().changeCounter(-100);
          incrementSize = -100;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorCubit>().state.color,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: context.watch<ColorCubit>().state.color,
            title: const Text(
              "Cubit Cubit with BlocListener",
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
                  context.read<CounterCubit>().changeCounter(incrementSize);
                },
                child: const Text(
                  "Increment Counter",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
