// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'anonymous_route_counter_cubit.dart';

class AnonymousRouteCounterState extends Equatable {
  final int counter;
  const AnonymousRouteCounterState({
    required this.counter,
  });

  factory AnonymousRouteCounterState.initial() {
    return const AnonymousRouteCounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  @override
  bool get stringify => true;

  AnonymousRouteCounterState copyWith({
    int? counter,
  }) {
    return AnonymousRouteCounterState(
      counter: counter ?? this.counter,
    );
  }
}
