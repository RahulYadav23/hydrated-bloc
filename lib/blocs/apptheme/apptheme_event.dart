part of 'apptheme_bloc.dart';

abstract class AppthemeEvent extends Equatable {
  const AppthemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeAppTheme extends AppthemeEvent {}
