part of 'pin_bloc.dart';

abstract class PinEvent extends Equatable {}

class NumberPressedEvent extends PinEvent {
  final String pin;
  final int currentLength;

  NumberPressedEvent({required this.pin, required this.currentLength});

  @override
  String toString() => 'NumberPressedEvent { pin : $pin }';

  @override
  List<Object?> get props => [pin, currentLength];
}

class DeleteEvent extends PinEvent {
  final int currentLength;

  DeleteEvent({required this.currentLength});
  @override
  String toString() => 'DeleteEvent';

  @override
  List<Object?> get props => [currentLength];
}

class DeleteAllEvent extends PinEvent {
  @override
  String toString() => 'DeleteAllEvent';

  @override
  List<Object?> get props => [];
}
