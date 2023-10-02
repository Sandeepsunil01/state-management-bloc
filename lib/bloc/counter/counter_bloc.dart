import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCountEvent>((event, emit) {
      final increse = state.copyWith(counter: state.counter + 1);
      debugPrint(increse.toString());
      emit(increse);
    });

    on<DecrementCountEvent>(_decrementCounter);
  }

  void _decrementCounter(
      DecrementCountEvent event, Emitter<CounterState> emit) {
    final decrease = state.copyWith(counter: state.counter - 1);
    debugPrint(decrease.toString());
    emit(decrease);
  }
}
