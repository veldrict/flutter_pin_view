import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pin_event.dart';
part 'pin_state.dart';

class PinBloc extends Bloc<PinEvent, PinState> {
  PinBloc() : super(InitialPinState());

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
