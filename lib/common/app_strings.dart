import 'app_constants.dart';

class AppStrings {
  //Team1
  static const welcome = 'Welcome';
  static const signIn = "Signin";
  static const yourDrs = "YOURDRS";
  static const doctorImg = 'assets/images/doctor_img.png';
  static const pinImage =   'assets/images/PinImage.png';
  static const loginWithDiffAcc = "Login with different account";
  static const userTouchAndFaceId = 'Use Touch or Face ID';
  static const enterPin = "Enter PIN";
  static const confirmPin = "Confirm PIN";
  static const createPin = "Create PIN";
  static const wrongPin = "WrongPin";
  static const pinNotMatched = "Pin Not Matched";
}

class ApiUrlConstants {

  /// getting the user Data
  static const getUser =
      AppConstants.dioBaseUrl + "api/Account/ValidatePin";
  static const generatePin =
      AppConstants.dioBaseUrl + "api/Account/GenerateMemberPin";

}
