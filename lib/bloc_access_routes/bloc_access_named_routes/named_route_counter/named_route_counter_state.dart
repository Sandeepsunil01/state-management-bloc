// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'named_route_counter_cubit.dart';

class NamedRouteCounterState extends Equatable {
  final int counter;
  const NamedRouteCounterState({
    required this.counter,
  });

  factory NamedRouteCounterState.initial() {
    return const NamedRouteCounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  @override
  bool get stringify => true;

  NamedRouteCounterState copyWith({
    int? counter,
  }) {
    return NamedRouteCounterState(
      counter: counter ?? this.counter,
    );
  }
}
