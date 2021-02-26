
import 'package:YOURDRS_FlutterAPP/ui/login/security_pin/biometrics/local_auth_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator =GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => LocalAuthenticationService());
}
