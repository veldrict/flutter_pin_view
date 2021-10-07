part of 'pin_bloc.dart';

abstract class PinState extends Equatable {}

class InitialPinState extends PinState {
  @override
  String toString() => 'InitialPinState';

  @override
  List<Object?> get props => [];
}

class NumberPinState extends PinState {
  final String pin;
  final int currentLength;

  NumberPinState({required this.pin, required this.currentLength});

  @override
  List<Object?> get props => [pin, currentLength];
}

class DeleteState extends PinState {
  final int currentLength;

  DeleteState({required this.currentLength});

  @override
  String toString() => 'DeleteState';

  @override
  List<Object?> get props => [currentLength];
}

class DeleteAllState extends PinState {
  @override
  String toString() => 'DeleteAllState';

  @override
  List<Object?> get props => [];
}
