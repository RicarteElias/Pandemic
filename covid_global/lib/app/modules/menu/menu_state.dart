import 'package:equatable/equatable.dart';

abstract class MenuStateState extends Equatable {

  final List propss;
  MenuStateState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnMenuStateState extends MenuStateState {

  UnMenuStateState();

  @override
  String toString() => 'UnMenuStateState';
}

/// Initialized
class InMenuStateState extends MenuStateState {
  final String hello;

  InMenuStateState(this.hello) : super([hello]);

  @override
  String toString() => 'InMenuStateState $hello';

}

class ErrorMenuStateState extends MenuStateState {
  final String errorMessage;

  ErrorMenuStateState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorMenuStateState';
}
