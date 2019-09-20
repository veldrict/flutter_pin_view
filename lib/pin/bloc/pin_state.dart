import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PinState extends Equatable {
  PinState([List props = const <dynamic>[]]) : super(props);
}

class InitialPinState extends PinState {
  @override
  String toString() => 'InitialPinState';
}

class NumberPinState extends PinState {
  final String pin;
  final int currentLength;

  NumberPinState({@required this.pin, @required this.currentLength}) : super([pin, currentLength]);
}

class DeleteState extends PinState{
  final int currentLength;
  
  DeleteState({@required this.currentLength}): super([currentLength]);

  @override
  String toString() => 'DeleteState';
}

class DeleteAllState extends PinState{
  @override
  String toString() => 'DeleteAllState';
}
