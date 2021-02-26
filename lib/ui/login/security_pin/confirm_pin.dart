import 'package:YOURDRS_FlutterAPP/blocs/pin_screen_bloc/pin_bloc.dart';
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/ui/login/security_pin/verify_security_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';

class ConfirmPinScreen extends StatelessWidget {
  ConfirmPinScreen({
    Key key,
    this.data1,
  }) : super(key: key);
  final String data1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: PinPutView(
        data: data1,
      )),
    );
  }
}

class PinPutView extends StatefulWidget {
  PinPutView({Key key, this.data}) : super(key: key);
  final String data;

  @override
  PinPutViewState createState() => PinPutViewState();
}

class PinPutViewState extends State<PinPutView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final dataBloc = BlocProvider.of<DataBloc>(context);

    var StoredPin = widget.data;
    void _showSnackBar(String pin) {
      final snackBar =
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Container(
          height: 80.0,
          child: Center(
            child: Text(
              AppStrings.pinNotMatched,
              style: const TextStyle(fontSize: 25.0),
            ),
          ),
        ),
        backgroundColor: Colors.redAccent,
      );
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }

    // TODO: implement build
    final BoxDecoration pinPutDecoration = BoxDecoration(
      //color: const Color.fromRGBO(62, 136, 210, 1.0),
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
                    AppStrings.confirmPin,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: height * 0.05),
                Container(
                  height: height * 0.08,
                  width: width * 0.65,
                  //color: Colors.deepPurpleAccent,
                  child:
                      // EnterInputFields(data2: widget.data,),
                      Form(
                    key: _formKey,
                    child: GestureDetector(
                      onLongPress: () {
                        print(_formKey.currentState.validate());
                      },
                      child: PinPut(
                        validator: (s) {
                          if (s.contains('1')) return null;
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
                          if (pin == StoredPin) {
                            print("Successful $StoredPin");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerifyPinScreen(data1: StoredPin,)));
                          } else {
                            _showSnackBar(pin);
                            print('Pin Not Matched');
                          }
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
                  child: Text(
                    AppStrings.loginWithDiffAcc,
                    style: TextStyle(color: Colors.white, fontSize: 20,decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  child: Text(
                    AppStrings.userTouchAndFaceId,
                    style: TextStyle(color: Colors.white, fontSize: 20),
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

// OrientationBuilder(
// builder: (context, orientation){
// if(orientation == Orientation.portrait){
// return _portraitMode();
// }else{
// return _landscapeMode();
// }
// },
// ),
//);
