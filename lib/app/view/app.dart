import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/app/app.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import '../../cart/cart.dart';
import '../../catalog/catalog.dart';
import '../../shopping_repository.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    required TodosRepository this.todosRepository,
    required ShoppingRepository this.shoppingRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;
  final TodosRepository todosRepository;
  final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (context) => _authenticationRepository,
        ),
        RepositoryProvider<TodosRepository>(
          create: (context) => todosRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (_) => CartBloc(
              shoppingRepository: shoppingRepository,
            )..add(CartStarted()),
          ),
          BlocProvider(
            create: (_) => CatalogBloc(
              shoppingRepository: shoppingRepository,
            )..add(CatalogStarted()),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
      // The Mandy red, light theme.
      theme: FlexThemeData.light(scheme: FlexScheme.red, useMaterial3: true),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.amber),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
