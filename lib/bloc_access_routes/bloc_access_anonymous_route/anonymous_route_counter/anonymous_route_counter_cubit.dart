import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'anonymous_route_counter_state.dart';

class AnonymousRouteCounterCubit extends Cubit<AnonymousRouteCounterState> {
  AnonymousRouteCounterCubit() : super(AnonymousRouteCounterState.initial());

  void increament() {
    emit(state.copyWith(counter: state.counter + 1));
  }
}
