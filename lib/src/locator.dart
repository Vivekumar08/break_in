import 'package:get_it/get_it.dart';
import 'services/api/api.dart';
import 'services/db/db.dart';
import 'services/location/location.dart';
import 'services/preferences.dart';

final GetIt locator = GetIt.instance;

setup() {
  // Api Services
  locator.registerLazySingleton<AppService>(() => AppService());
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<FoodPlaceService>(() => FoodPlaceService());
  locator.registerLazySingleton<OtpServiceViaEmail>(() => OtpServiceViaEmail());
  locator.registerLazySingleton<ProfileService>(() => ProfileService());
  locator.registerLazySingleton<UserService>(() => UserService());

  // DB services
  locator.registerLazySingleton<TokenStorage>(() => TokenStorage());
  locator.registerLazySingletonAsync<UserStorage>(
      () async => await UserStorage.init());

  // Location Service
  locator.registerLazySingleton<LocationService>(() => LocationService());

  // Other
  locator.registerLazySingletonAsync<Preferences>(() => Preferences.init());
}
