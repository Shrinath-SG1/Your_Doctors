import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class LocalAuthenticationService {
  final _auth = LocalAuthentication();

  bool isAuthenticated = false;

  ///  776015
  Future<void> authenticate() async {
    try {
      print("value authenticated");
      isAuthenticated = await _auth.authenticateWithBiometrics(
        localizedReason: 'authenticate to access',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print("value authenticated in catch");

      print(e);
    }
  }
}
