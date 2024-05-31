part of 'apptheme_bloc.dart';

enum AppTheme {
  light,
  dark;

  String toJson() => name;

  static AppTheme fromJson(String json) => values.byName(json);
}

class AppthemeState extends Equatable {
  final AppTheme appTheme;
  const AppthemeState({required this.appTheme});

  @override
  List<Object> get props => [appTheme];

  factory AppthemeState.initial() {
    return const AppthemeState(appTheme: AppTheme.light);
  }

  AppthemeState copyWith({AppTheme? appTheme}) {
    return AppthemeState(appTheme: appTheme ?? this.appTheme);
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'appTheme': appTheme.toJson()});

    return result;
  }

  factory AppthemeState.fromJson(Map<String, dynamic> json) {
    return AppthemeState(appTheme: AppTheme.fromJson(json['appTheme']));
  }
}
