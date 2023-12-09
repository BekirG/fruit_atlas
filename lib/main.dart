import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/bloc/fruit_bloc.dart';
import 'package:fruit_atlas/features/get_fruit/presentation/pages/fruit_page.dart';
import 'package:fruit_atlas/injection_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // Setup dependency injection using GetIt service locator.
  setupLocator();

  // Run the application wrapped in ProviderScope for Riverpod state management.
  runApp(const ProviderScope(child: MyApp()));
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Provide instances of Blocs to the widget tree.
      providers: [
        BlocProvider(create: (_) => locator<FruitBloc>()),
      ],
      child: MaterialApp(
        title: 'Fruit Atlas',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xffFFBE8F),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

/// Home widget representing the main screen of the application.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: FruitPage(),
    );
  }
}
