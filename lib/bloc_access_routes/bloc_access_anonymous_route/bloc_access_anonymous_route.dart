import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'anonymous_route_counter/anonymous_route_counter_cubit.dart';
import 'show_counter.dart';

class BlocAccessAnonymousRoute extends StatelessWidget {
  const BlocAccessAnonymousRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc Access Routes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider<AnonymousRouteCounterCubit>(
        create: (context) => AnonymousRouteCounterCubit(),
        child: const BlocAccessAnonymousRoutePage(),
      ),
    );
  }
}

class BlocAccessAnonymousRoutePage extends StatelessWidget {
  const BlocAccessAnonymousRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Access Anonymous Route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (conterContext) => BlocProvider.value(
                      value: context.read<AnonymousRouteCounterCubit>(),
                      child: ShowCounter(),
                    ),
                  ),
                );
              },
              child: const Text(
                "Show Counter",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AnonymousRouteCounterCubit>(context)
                      .increament();
                },
                child: const Text(
                  "Increment Counter",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
