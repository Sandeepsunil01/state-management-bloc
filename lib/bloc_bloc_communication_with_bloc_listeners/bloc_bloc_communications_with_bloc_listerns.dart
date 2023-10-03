import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc_bloc_communication_with_bloc_listeners/bloc/color/color_bloc.dart';
import 'package:state_management_bloc/bloc_bloc_communication_with_bloc_listeners/bloc/counter/counter_bloc.dart';

class BlocBlocWithBlocListerners extends StatelessWidget {
  const BlocBlocWithBlocListerners({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(create: (context) => ColorBloc()),
        BlocProvider<CounterBloc>(create: (context) => CounterBloc())
      ],
      child: MaterialApp(
        title: 'Bloc Bloc with BlocListeners',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const BlocBlocWithBlocListersPage(),
      ),
    );
  }
}

class BlocBlocWithBlocListersPage extends StatefulWidget {
  const BlocBlocWithBlocListersPage({super.key});

  @override
  State<BlocBlocWithBlocListersPage> createState() =>
      _BlocBlocWithBlocListersPageState();
}

class _BlocBlocWithBlocListersPageState
    extends State<BlocBlocWithBlocListersPage> {
  int incrementValue = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementValue = 1;
        } else if (state.color == Colors.green) {
          incrementValue = 10;
        } else if (state.color == Colors.blue) {
          incrementValue = 100;
        } else if (state.color == Colors.black) {
          incrementValue = -100;
          context
              .read<CounterBloc>()
              .add(ChangeCounterEvent(incrementSize: incrementValue));
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorBloc>().state.color,
        appBar: AppBar(
          backgroundColor: context.watch<ColorBloc>().state.color,
          title: const Text(
            "Bloc Bloc with BlocListeners",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<ColorBloc>().add(ChangeColorEvent());
                },
                child: const Text(
                  "Change Color",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "${context.watch<CounterBloc>().state.counter}",
                style: const TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(ChangeCounterEvent(incrementSize: incrementValue));
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
