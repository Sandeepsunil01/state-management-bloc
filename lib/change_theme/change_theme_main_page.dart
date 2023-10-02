import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/change_theme/theme_cubit/theme_cubit.dart';

class ChangeThemeApp extends StatelessWidget {
  const ChangeThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider<ThemeBloc>(
    //   create: (context) => ThemeBloc(),
    //   // This is Using Bloc Builder
    //   // child: BlocBuilder<ThemeBloc, ThemeState>(
    //   //   builder: (context, state) {
    //   //     return MaterialApp(
    //   //       title: "Change Theme Bloc",
    //   //       debugShowCheckedModeBanner: false,
    //   //       theme: state.appTheme == AppTheme.light
    //   //           ? ThemeData.light(
    //   //               useMaterial3: true,
    //   //             )
    //   //           : ThemeData.dark(
    //   //               useMaterial3: true,
    //   //             ),
    //   //       home: const ThemePage(),
    //   //     );
    //   //   },
    //   // ),

    //   // With using extensions method
    //   // If Builder is not used then the bloc doenst get the context
    //   // child: Builder(builder: (context) {
    //   //   return MaterialApp(
    //   //     title: "Change Theme Bloc",
    //   //     debugShowCheckedModeBanner: false,
    //   //     theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
    //   //         ? ThemeData.light(useMaterial3: true)
    //   //         : ThemeData.dark(useMaterial3: true),
    //   //     home: const ThemePage(),
    //   //   );
    //   // }),
    // );

    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: ((context, state) {
          return MaterialApp(
            title: "Change Theme Cubit",
            debugShowCheckedModeBanner: false,
            theme: state.appTheme == AppTheme.light
                ? ThemeData.light(useMaterial3: true)
                : ThemeData.dark(useMaterial3: true),
            home: const ThemePage(),
          );
        }),
      ),
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
            // This is Called for Bloc
            // context
            //     .read<ThemeBloc>()
            //     .add(ChangeThemeEvent(randomInt: randomInt));

            // This is called for Cubit
            context.read<ThemeCubit>().changeTheme(randomInt);
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
