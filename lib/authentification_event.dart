import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthentificationEvent extends Equatable {
  AuthentificationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthentificationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthentificationEvent {
  final String token;

  LoggedIn({@required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthentificationEvent {
  @override
  String toString() => 'LoggedOut';
}