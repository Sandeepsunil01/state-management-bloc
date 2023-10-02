import 'package:flutter/material.dart';
import 'package:state_management_bloc/cubit_cubit_communication_with_bloc_listeners/cubit_cubit_communication_with_bloc_listener.dart';

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
  runApp(const CubitToCubitCommunicationWithBlocListener());
}
