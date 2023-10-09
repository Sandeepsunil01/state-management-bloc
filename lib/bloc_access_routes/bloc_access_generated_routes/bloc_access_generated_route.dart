import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc_access_routes/bloc_access_generated_routes/generated_route_counter/generated_route_counter_cubit.dart';
import 'package:state_management_bloc/bloc_access_routes/bloc_access_generated_routes/show_generated_counter.dart';

class BlocAccessGeneratedRoute extends StatefulWidget {
  const BlocAccessGeneratedRoute({super.key});

  @override
  State<BlocAccessGeneratedRoute> createState() =>
      _BlocAccessGeneratedRouteState();
}

class _BlocAccessGeneratedRouteState extends State<BlocAccessGeneratedRoute> {
  final GeneratedRouteCounterCubit _generatedRouteCounterCubit =
      GeneratedRouteCounterCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc Access Generated Route",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: _generatedRouteCounterCubit,
                child: const BlocAccessGeneratedRoutePage(),
              ),
            );
          case "/counter":
            return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: _generatedRouteCounterCubit,
                child: const ShowGeneratedCounter(),
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}

class BlocAccessGeneratedRoutePage extends StatelessWidget {
  const BlocAccessGeneratedRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Access Generated Routes")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/counter");
              },
              child: const Text(
                "Show Counter",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<GeneratedRouteCounterCubit>(context)
                    .increment();
              },
              child: const Text(
                "Increment Counter",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
