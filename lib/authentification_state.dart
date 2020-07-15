import 'package:equatable/equatable.dart';

abstract class AuthentificationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthentificationState {}

class AuthenticationAuthenticated extends AuthentificationState {}

class AuthenticationUnauthenticated extends AuthentificationState {}

class AuthenticationLoading extends AuthentificationState {}