import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increament() {
    final increse = state.copyWith(counter: state.counter + 1);
    debugPrint(increse.toString());
    emit(increse);
  }

  void decrement() {
    final decrease = state.copyWith(counter: state.counter - 1);
    debugPrint(decrease.toString());
    emit(decrease);
  }
}
