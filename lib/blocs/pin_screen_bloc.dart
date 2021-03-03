import 'dart:async';
import 'dart:developer';
import 'package:YOURDRS_FlutterAPP/data/model/response/pin_response.dart';
import 'package:YOURDRS_FlutterAPP/network/api_pin.dart';
import 'package:bloc/bloc.dart';

part 'pin_screen_event.dart';

part 'pin_screen_state.dart';

class PinScreenBloc extends Bloc<PinScreenEvent, PinScreenState> {
  PinRepo pinRepo;
  PinScreenBloc(this.pinRepo) : super(PinScreenState(isTrue: true));
var Truestatus=200;
  var Falsestatus=0;
  @override

  Stream<PinScreenState> mapEventToState(
    PinScreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is PinScreenEvent){
      PinResponse pinResponse= await pinRepo.postApiMethod(event.id.toString(), event.pin);
      // if(pinResponse==null)
      //   {
      //     yield PinScreenState(Loading: true);
      //   }
      print(pinResponse);
      if(pinResponse.header.statusCode=="200") {
        print('HomeScreen');
        yield PinScreenState(isTrue: true);
      }
      else if (pinResponse.header.statusCode== "401"){
        print('ShowSnackbar');
         yield PinScreenState(isTrue: false);
      }
      // if(pinResponse.userId=='1'){
      //
      // }
      //
    // if (event is PinScreenEvent) {
    //   if (event.pin == event.StoredVal) {
    //     print("Successful in bloc");
    //     yield PinScreenState(isTrue: true);
    //   } else {
    //     // _showSnackBar(pin);
    //     print('${event.StoredVal} Wrong Pin ');
    //     yield PinScreenState(isTrue: false);
    //   }
    }
  }
}
