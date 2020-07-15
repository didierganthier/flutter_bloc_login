import 'dart:async';

import 'package:flutterbloclogin/authentification_event.dart';
import 'package:flutterbloclogin/authentification_state.dart';
import 'package:flutterbloclogin/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class AuthenticationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthentificationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthentificationState> mapEventToState(
      AuthentificationState currentState,
      AuthentificationEvent event,
      ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}