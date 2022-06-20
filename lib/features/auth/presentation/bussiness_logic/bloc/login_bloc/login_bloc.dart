import 'dart:async';

import 'package:auth_template/features/auth/data/models/user_info.dart';
import 'package:auth_template/features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_event.dart';
import 'package:auth_template/locator.dart';
import 'package:bloc/bloc.dart';
import '../../../../data/repository/repositories.dart';
import '../auth_bloc/auth_bloc.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  }) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) => _loginButtonPressed(event, emit));
  }

  _loginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final data = await userRepository.login(
        event.email!,
        event.password!,
      );
      authenticationBloc
          .add(LoggedIn(token: data['token'], userId: data['userId']));
      locator.get<UserInfo>().setId = data['userId']!;
      locator.get<UserInfo>().setToken = data['token']!;
      emit(LoginInitial());
    } catch (error) {
      emit(LoginFailure(error: "Erreur de connexion"));
      rethrow;
    }
  }
}
