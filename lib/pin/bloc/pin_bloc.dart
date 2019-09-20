import 'dart:async';
import 'package:bloc/bloc.dart';
import './pin.dart';

class PinBloc extends Bloc<PinEvent, PinState> {
  @override
  PinState get initialState => InitialPinState();

  @override
  Stream<PinState> mapEventToState(
    PinEvent event,
  ) async* {
    if (event is NumberPressedEvent) {
      int currentLenght = event.currentLength + 1;
      yield NumberPinState(pin: event.pin, currentLength: currentLenght);
    }
    if (event is DeleteEvent) {
      int currentLength = event.currentLength - 1;
      yield DeleteState(currentLength: currentLength);
    }
    if (event is DeleteAllEvent) {
      yield DeleteAllState();
    }
  }
}
