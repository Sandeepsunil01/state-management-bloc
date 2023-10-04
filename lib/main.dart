import 'package:flutter/material.dart';

import 'bloc_access_context/bloc_access_context.dart';

void main() {
  // This Runs Counter Cubit Code
  // runApp(const CounterCubitApp());

  // This Runs Counter Bloc Code
  // runApp(const CounterBlocApp());

  // In order to Pass Data down the Widget Tree
  // runApp(const ChangeThemeApp());

  // Communication between Cubit to Cubit using Stream Subscription
  // runApp(const CubitToCubitCommunicationWithStreamSubscription());

  // Communication between Cubit to Cubit using Bloc Listener
  // runApp(const CubitToCubitCommunicationWithBlocListener());

  // Communication between Bloc to Bloc using Stream Subscription
  // runApp(const BlocBlocWithStreamSubscription());

  // Communication between Bloc to Bloc using Bloc Listeners
  // runApp(const BlocBlocWithBlocListerners());

  // Bloc Access Context
  runApp(const BlocAccessContext());
}
