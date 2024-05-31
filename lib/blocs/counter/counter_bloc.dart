import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> with HydratedMixin {
  CounterBloc() : super(CounterState.initial()) {
    hydrate();
    on<IncrementCounter>((event, emit) {
      emit(state.copyWith(
        counter: state.counter + 1,
      ));
    });
    on<DecrementCounter>(
      (event, emit) {
        emit(state.copyWith(
          counter: state.counter - 1,
        ));
      },
    );
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toJson();
  }
}
