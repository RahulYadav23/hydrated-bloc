import 'package:counter_hydrated/blocs/apptheme/apptheme_bloc.dart';
import 'package:counter_hydrated/blocs/counter/counter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => AppthemeBloc(),
        )
      ],
      child: BlocBuilder<AppthemeBloc, AppthemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Couter Hydrated',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: state.appTheme == AppTheme.light
                    ? Brightness.light
                    : Brightness.dark,
              ),
              useMaterial3: true,
            ),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "${context.watch<CounterBloc>().state.counter}",
          style: const TextStyle(
            fontSize: 104,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(
              Icons.add,
            ),
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounter());
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(
              Icons.remove,
            ),
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounter());
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(
              context.watch<AppthemeBloc>().state.appTheme == AppTheme.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              context.read<AppthemeBloc>().add(ChangeAppTheme());
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(
              Icons.delete,
            ),
            onPressed: () {
              HydratedBloc.storage.clear();
            },
          ),
        ],
      ),
    );
  }
}
