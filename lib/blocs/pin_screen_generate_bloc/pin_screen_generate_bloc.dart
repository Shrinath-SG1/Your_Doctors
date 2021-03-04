import 'dart:async';

import 'package:YOURDRS_FlutterAPP/data/model/response/pin_generation_model.dart';
import 'package:YOURDRS_FlutterAPP/network/pin_generation_api.dart';
import 'package:bloc/bloc.dart';

part 'pin_screen_generate_event.dart';
part 'pin_screen_generate_state.dart';

class PinScreenGenerateBloc extends Bloc<PinGenerateScreenEvent, PinGenerateScreenState> {
  PinGenerateResponse pinGenerateResponse;
  PinScreenGenerateBloc(this.pinGenerateResponse) : super(PinGenerateScreenState());

  @override
  Stream<PinGenerateScreenState> mapEventToState(
    PinGenerateScreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is PinGenerateScreenEvent){
      PinGenerateModel pinGenerateModel = await pinGenerateResponse.postApiMethod(event.memberId,event.pin);
      print(pinGenerateModel);
      if(pinGenerateModel.header.statusCode=="200") {
        print('Validate Screen');
        yield PinGenerateScreenState(isTrue: true);
      }
      else if (pinGenerateModel.header.statusCode== "406"){
        print('ShowSnackbar');
        yield PinGenerateScreenState(isTrue: false);
      }
    }
  }
}
