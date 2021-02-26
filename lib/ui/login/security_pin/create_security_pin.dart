import 'package:YOURDRS_FlutterAPP/blocs/pin_screen_bloc/pin_bloc.dart';
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/ui/login/security_pin/DemoScreen.dart';
import 'package:YOURDRS_FlutterAPP/ui/login/security_pin/biometrics/local_auth_service.dart';
import 'package:YOURDRS_FlutterAPP/ui/login/security_pin/biometrics/service_locator.dart';
import 'package:YOURDRS_FlutterAPP/ui/login/security_pin/confirm_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pinput/pin_put/pin_put.dart';

final _formKey = GlobalKey<FormState>();

class CreatePinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: PinPutView()
      ),
    );
  }
}

class PinPutView extends StatefulWidget {
  @override
  PinPutViewState createState() => PinPutViewState();
}

class PinPutViewState extends State<PinPutView> {
  final LocalAuthenticationService _localAuth = locator<LocalAuthenticationService>();

  @override
  Widget build(BuildContext context) {

    var StorePin;
    // TODO: implement build
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
    );

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Widget _smallAndBigDisplay() {
      return Container(
        color: CustomizedColors.PinScreenColor,
        child: Container(
          height: height,
          // width: width,

          child: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    //color: Colors.yellowAccent,
                    child: Text(
                      AppStrings.yourDrs,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Image.asset(AppStrings.doctorImg),
                  )
                ]),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 0),
                  child: Container(
                      height: height * 0.13,
                      //width: width*0.25,
                      child: Image.asset(AppStrings.pinImage)),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  child: Text(
                    AppStrings.createPin,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: height * 0.05),
                Container(
                  //color: Colors.red,
                  height: height * 0.06,
                  width: width * 0.65,
                  //color: Colors.deepPurpleAccent,
                  child: Form(
                    key: _formKey,
                    child: GestureDetector(
                      onLongPress: () {
                        print(_formKey.currentState.validate());
                      },
                      child: PinPut(
                        validator: (s) {
                          if (s.contains('2')) return null;
                          return '';
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        withCursor: true,
                        fieldsCount: 4,
                        fieldsAlignment: MainAxisAlignment.spaceAround,
                        textStyle: const TextStyle(
                            fontSize: 25.0, color: Colors.black),
                        eachFieldMargin: EdgeInsets.all(0),
                        eachFieldWidth: 20.0,
                        eachFieldHeight: 25.0,
                        onSubmit: (String pin) {
                          StorePin = pin;
                          print('Saved Value is $StorePin');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConfirmPinScreen(
                                        data1: StorePin,
                                      )));
                        },
                        submittedFieldDecoration: pinPutDecoration,
                        selectedFieldDecoration: pinPutDecoration.copyWith(
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: const Color.fromRGBO(160, 215, 220, 1),
                          ),
                        ),
                        followingFieldDecoration: pinPutDecoration,
                        pinAnimationType: PinAnimationType.scale,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.10,
                ),
                Container(
                  child: GestureDetector(
                    child: Text(
                      AppStrings.loginWithDiffAcc,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  child: GestureDetector(
                    onTap: _localAuth.authenticate,
                    //   () => Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => FingerprintPage(),),),
                    child: Text(
                      AppStrings.userTouchAndFaceId,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ]),
              //_bottomAppBar,
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 500) {
          return _smallAndBigDisplay();
        } else {
          return _smallAndBigDisplay();
        }
      }),
    );
  }
}
