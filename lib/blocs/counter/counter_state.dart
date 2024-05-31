part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({required this.counter});

  @override
  List<Object?> get props => [counter];

  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result.addAll({'counter': counter});
    return result;
  }

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(counter: json['counter']?.toInt() ?? 0);
  }
}
