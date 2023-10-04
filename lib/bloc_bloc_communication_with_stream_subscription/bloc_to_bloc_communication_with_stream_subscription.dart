import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc_bloc_communication_with_stream_subscription/bloc/color/color_bloc.dart';
import 'package:state_management_bloc/bloc_bloc_communication_with_stream_subscription/bloc/counter/counter_bloc.dart';

class BlocBlocWithStreamSubscription extends StatelessWidget {
  const BlocBlocWithStreamSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(create: (context) => ColorBloc()),
        BlocProvider<CounterBloc>(
            create: (context) =>
                CounterBloc(colorBloc: context.read<ColorBloc>()))
      ],
      child: MaterialApp(
        title: 'Bloc Bloc with Stream Subscription',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const BlocBlocWithStreamSubscriptionPage(),
      ),
    );
  }
}

class BlocBlocWithStreamSubscriptionPage extends StatefulWidget {
  const BlocBlocWithStreamSubscriptionPage({super.key});

  @override
  State<BlocBlocWithStreamSubscriptionPage> createState() =>
      _BlocBlocWithStreamSubscriptionPageState();
}

class _BlocBlocWithStreamSubscriptionPageState
    extends State<BlocBlocWithStreamSubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorBloc>().state.color,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: context.watch<ColorBloc>().state.color,
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
                context.read<CounterBloc>().add(ChangeCounterEvent());
              },
              child: const Text(
                "Increment Counter",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
