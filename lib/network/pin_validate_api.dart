
import 'package:YOURDRS_FlutterAPP/common/app_constants.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/response/pin_validate_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PinRepo {
  Future<PinResponse> postApiMethod(String MemberId,String Pin) async{
    try {
      var endpointUrl = ApiUrlConstants.getUser;
      Map<String, dynamic> queryParams = {
        'MemberId': MemberId,
        'Pin': Pin,
        "FingerPrintValidation": "false",
      };
      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      print('requestUrl $requestUrl');

      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      print(response.body);

      if (response.statusCode == 200) {
        PinResponse pinResponse = parsePinResponse(response.body);
        print(pinResponse);
        return pinResponse;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  static PinResponse parsePinResponse(String responseBody){
    final PinResponse pinResponse = PinResponse.fromJson(jsonDecode(responseBody));
    print(pinResponse);
    return pinResponse;
  }

}


// Future<PinResponse> postApiMethod() async {
//   String apiUrl = ApiUrlConstants.getUser;
//
//   final json = {
//
//     "userName": 'Admin',
//     "password": "as",
//     "deviceCode": "string",
//     "encryptionKey": "string"
//   };
//
//   http.Response response = await http.post(
//     apiUrl, body: jsonEncode(json), headers: <String, String>{
//     'Content-Type': 'application/json; charset=UTF-8',
//   },);
//
//   var jsonResponse = jsonDecode(response.body);
//   print(jsonResponse);
//   return PinResponse.fromJson(jsonResponse);
// }

// import 'dart:convert';
// import 'package:YOURDRS_FlutterAPP/data/model/response/pin_validate_model.dart';
// import 'package:http/http.dart' as http;
//
// final String apiURL = 'https://ydrsdevapi.yourdrs.com/api/Account/ValidatePin?MemberId=1&Pin=0101&IsFingerPrintValidation=false';
//
// Future<List<PinResponse>> fetchJSONData() async {
//   var jsonResponse = await http.get(apiURL);
//
//   if (jsonResponse.statusCode == 200) {
//     final jsonItems = json.decode(jsonResponse.body).cast<
//         Map<String, dynamic>>();
//
//     List<PinResponse> usersList = jsonItems.map<PinResponse>((json) {
//       return PinResponse.fromJson(json);
//     }).toList();
//
//     return usersList;
//   } else {
//     throw Exception('Failed to load data from internet');
//   }
// }



// port 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';
//
// import 'package:YOURDRS_FlutterAPP/data/model/response/pin_validate_model.dart';
//
// Future<PinResponse> createPinState(String username, String password) async {
//   final http.Response response = await http.post(
//       'http://192.168.43.76//soledesign/wp-json/jwt-auth/v1/token',
//       headers: <String, String>{
//         'Accept': 'application/json',
//       },
//       body: {
//         'username': username,
//         'password': password,
//       });
//
//   if (response.statusCode == 200) {
//     print(response.body);
//     return LoginResponse.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to create album.');
//   }
// }