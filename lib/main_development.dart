import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_login/app/app.dart';
import 'package:todos_repository/todos_repository.dart';
import 'firebase_options.dart';
import 'package:local_storage_todos_api/local_storage_todos_api.dart';
import 'package:device_preview/device_preview.dart';
import '../../shopping_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  final todosApi = LocalStorageTodosApi(
    plugin: await SharedPreferences.getInstance(),
  );

  final todosRepository = TodosRepository(todosApi: todosApi);

  final Todo todo = Todo(title: 'title');
  todosApi.saveTodo(todo);

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => App(
        authenticationRepository: authenticationRepository,
        todosRepository: todosRepository,
        shoppingRepository: ShoppingRepository(),
      ),
    ),
  );
}
