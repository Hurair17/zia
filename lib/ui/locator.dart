import 'package:get_it/get_it.dart';
import 'package:recrutment_help_app/core/services/database_service.dart';

import '../core/services/auth_service.dart';
import '../core/services/local_storage_services.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  // final _instance = await LocalStorageService.getInstance();
  // locator.registerSingleton(_instance);
  locator.registerSingleton(LocalStorageService());

  // locator.registerSingleton(NotificationsService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerSingleton<AuthService>(AuthService());
  // locator.registerSingleton<ApiServices>(ApiServices());
  // locator.registerSingleton<LocationService>(LocationService());
  // locator.registerLazySingleton(() => FilePickerService());
}
