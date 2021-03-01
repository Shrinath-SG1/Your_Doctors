import 'dart:async';

import 'package:YOURDRS_FlutterAPP/ui/login/security_pin/DemoScreen.dart';
import 'package:YOURDRS_FlutterAPP/ui/login/security_pin/biometrics/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


part 'pin_screen_event.dart';
part 'pin_screen_state.dart';

class PinScreenBloc extends Bloc<PinScreenEvent, dynamic> {
  //final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<NavigatorState> navigatorKey;
  // var StoredValue;
  // var Pin;
  PinScreenBloc(this.navigatorKey) : super(PinScreenState());
  //PinScreenBloc() : super(PinScreenState());
  dynamic get initialState => 0;
  @override
  Stream<dynamic> mapEventToState(PinScreenEvent event,)
  async* {
    // TODO: implement mapEventToState
    if(event is PinScreenEvent)
      if (event.pin == event.StoredVal) {
        print("Successful in bloc");
        // SchedulerBinding.instance.addPostFrameCallback((_) {
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) {
        //         return Welcome();
        //       },
        //     ),
        //   );
        //   return;
        // });
       navigatorKey.currentState.pushNamed('/');
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Welcome()));
      } else {
        // _showSnackBar(pin);
        print('${event.StoredVal} Wrong Pin ');
      }

    }
  }

