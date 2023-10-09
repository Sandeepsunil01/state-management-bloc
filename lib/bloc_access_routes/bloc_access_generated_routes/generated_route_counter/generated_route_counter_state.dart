// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'generated_route_counter_cubit.dart';

class GeneratedRouteCounterState extends Equatable {
  final int counter;
  const GeneratedRouteCounterState({required this.counter});

  factory GeneratedRouteCounterState.initial() {
    return const GeneratedRouteCounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  @override
  bool get stringify => true;

  GeneratedRouteCounterState copyWith({
    int? counter,
  }) {
    return GeneratedRouteCounterState(
      counter: counter ?? this.counter,
    );
  }
}
