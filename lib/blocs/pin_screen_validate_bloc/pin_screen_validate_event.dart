part of 'pin_screen_validate_bloc.dart';
// enum PinScreenEvents{verify}
class PinScreenEvent {
  var memberId;
  var pin;
  var verify;
  //var StoredVal;


   PinScreenEvent(this.pin,this.verify,this.memberId);
}