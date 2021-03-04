import 'dart:async';
import 'package:YOURDRS_FlutterAPP/data/model/response/pin_validate_model.dart';
import 'package:YOURDRS_FlutterAPP/network/pin_validate_api.dart';
import 'package:bloc/bloc.dart';

part 'pin_screen_validate_event.dart';

part 'pin_screen_validate_state.dart';

class PinScreenBloc extends Bloc<PinScreenEvent, PinScreenState> {
  PinRepo pinRepo;
  PinScreenBloc(this.pinRepo) : super(PinScreenState(isTrue: true));

  @override

  Stream<PinScreenState> mapEventToState(
    PinScreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is PinScreenEvent){
      PinResponse pinResponse= await pinRepo.postApiMethod(event.memberId.toString(), event.pin);
      // if(pinResponse==null)
      //   {
      //     yield PinScreenState(Loading: true);
      //   }
      print(pinResponse);
      if(pinResponse.header.statusCode=="200") {
        var username=pinResponse.userName;
        print('HomeScreen user is $username');
        yield PinScreenState(isTrue: true,name: username);
      }
      else if (pinResponse.header.statusCode== "401"){
        print('ShowSnackbar');
         yield PinScreenState(isTrue: false);
      }
    }
  }
}
