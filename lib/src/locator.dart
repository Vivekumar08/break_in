import 'package:get_it/get_it.dart';
import 'services/api/api.dart';
import 'services/db/db.dart';

final GetIt locator = GetIt.instance;

setup() {
  // Services
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<TokenStorage>(() => TokenStorage());
}
