import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc_access_routes/bloc_access_named_routes/named_route_counter/named_route_counter_cubit.dart';
import 'package:state_management_bloc/bloc_access_routes/bloc_access_named_routes/show_named_counter.dart';

class BlocAccessNamedRoute extends StatefulWidget {
  const BlocAccessNamedRoute({super.key});

  @override
  State<BlocAccessNamedRoute> createState() => _BlocAccessNamedRouteState();
}

class _BlocAccessNamedRouteState extends State<BlocAccessNamedRoute> {
  final NamedRouteCounterCubit _namedRouteCounterCubit =
      NamedRouteCounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc Access Named Routes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        "/": (context) => BlocProvider.value(
              value: _namedRouteCounterCubit,
              child: const BlocAccessNamedRoutePage(),
            ),
        "/counter": (context) => BlocProvider.value(
              value: _namedRouteCounterCubit,
              child: const ShowNamedCounter(),
            ),
      },
    );
  }

  @override
  void dispose() {
    _namedRouteCounterCubit.close();
    super.dispose();
  }
}

class BlocAccessNamedRoutePage extends StatelessWidget {
  const BlocAccessNamedRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Access Named Routes")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
              child: const Text(
                "Show Counter",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<NamedRouteCounterCubit>(context).increment();
              },
              child: const Text(
                "Increment Counter",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
