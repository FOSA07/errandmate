import '../../route/route.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton<GoRouter>(() => routes);
}