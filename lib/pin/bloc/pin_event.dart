import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PinEvent extends Equatable {
  PinEvent([List props = const <dynamic>[]]) : super(props);
}

class NumberPressedEvent extends PinEvent {
  final String pin;
  final int currentLength;

  NumberPressedEvent({@required this.pin, @required this.currentLength}) : super([pin, currentLength]);

  @override
  String toString() => 'NumberPressedEvent { pin : $pin }';
}

class DeleteEvent extends PinEvent {
  final int currentLength;

  DeleteEvent({@required this.currentLength}): super([currentLength]);
  @override
  String toString() => 'DeleteEvent';
}

class DeleteAllEvent extends PinEvent {
  @override
  String toString() => 'DeleteAllEvent';
}
