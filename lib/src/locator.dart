import 'package:get_it/get_it.dart';
import 'services/api/api.dart';

final GetIt locator = GetIt.instance;

setup() {
  // Services
  locator.registerLazySingleton<AuthService>(() => AuthService());
}
