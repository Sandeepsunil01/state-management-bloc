import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/change_theme/theme/theme_bloc.dart';

class ChangeThemeApp extends StatelessWidget {
  const ChangeThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      // This is Using Bloc Builder
      // child: BlocBuilder<ThemeBloc, ThemeState>(
      //   builder: (context, state) {
      //     return MaterialApp(
      //       title: "Change Theme",
      //       debugShowCheckedModeBanner: false,
      //       theme: state.appTheme == AppTheme.light
      //           ? ThemeData.light(
      //               useMaterial3: true,
      //             )
      //           : ThemeData.dark(
      //               useMaterial3: true,
      //             ),
      //       home: const ThemePage(),
      //     );
      //   },
      // ),

      // With using extensions method
      // If Builder is not used then the bloc doenst get the context
      child: Builder(builder: (context) {
        return MaterialApp(
          title: "Change Theme",
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
              ? ThemeData.light(useMaterial3: true)
              : ThemeData.dark(useMaterial3: true),
          home: const ThemePage(),
        );
      }),
    );
  }
}

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final int randomInt = Random().nextInt(10);
            debugPrint("Random Number == $randomInt");

            context
                .read<ThemeBloc>()
                .add(ChangeThemeEvent(randomInt: randomInt));
          },
          child: const Text(
            "Change Theme",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
