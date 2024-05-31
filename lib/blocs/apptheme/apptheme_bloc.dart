import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'apptheme_event.dart';
part 'apptheme_state.dart';

class AppthemeBloc extends Bloc<AppthemeEvent, AppthemeState>
    with HydratedMixin {
  AppthemeBloc() : super(AppthemeState.initial()) {
    on<ChangeAppTheme>((event, emit) {
      emit(state.copyWith(
        appTheme:
            state.appTheme == AppTheme.light ? AppTheme.dark : AppTheme.light,
      ));
    });
  }

  @override
  AppthemeState? fromJson(Map<String, dynamic> json) {
    return AppthemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AppthemeState state) {
    return state.toJson();
  }
}
