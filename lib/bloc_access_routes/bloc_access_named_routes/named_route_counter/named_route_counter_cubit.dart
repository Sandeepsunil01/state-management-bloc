import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'named_route_counter_state.dart';

class NamedRouteCounterCubit extends Cubit<NamedRouteCounterState> {
  NamedRouteCounterCubit() : super(NamedRouteCounterState.initial());

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }
}
