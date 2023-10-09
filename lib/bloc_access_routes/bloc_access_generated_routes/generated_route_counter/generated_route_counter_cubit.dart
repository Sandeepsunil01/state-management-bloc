import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'generated_route_counter_state.dart';

class GeneratedRouteCounterCubit extends Cubit<GeneratedRouteCounterState> {
  GeneratedRouteCounterCubit() : super(GeneratedRouteCounterState.initial());

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }
}
