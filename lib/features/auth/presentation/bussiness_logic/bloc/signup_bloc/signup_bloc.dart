import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presentation/bussiness_logic/bloc/signup_bloc/signup_event.dart';
import '../../../../presentation/bussiness_logic/bloc/signup_bloc/signup_state.dart';
import '../../../../data/repository/repositories.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;
  SignupBloc({required this.userRepository}) : super(SignupInitial()) {
    on<SignupButtonPressed>((event, emit) => _signupButtonPressed(event, emit));
  }

  _signupButtonPressed(
      SignupButtonPressed event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    try {
      await Future.delayed(const Duration(seconds: 3));
      // var response = await userRepository.signUp(
      //     username: event.username,
      //     password: event.password,
      //     email: event.email,
      //     phone: event.phone);
      String reponse = "inscription réussi";
      emit(SignupSuccess(reponse: reponse));
    } on DioError catch(e) {
      if (e.type == DioErrorType.connectTimeout) {
        emit(const SignupFailure(error: "Vérifier votre connexion : Time out"));
        rethrow;
      } else if (e.message.startsWith("SocketException: Failed host lookup")) {
        emit(
            const SignupFailure(error: "Vous n'êtes pas connectés à internet "));
        rethrow;
      } else {
        emit(const SignupFailure(
            error: "Erreur lors de la récupération des données"));
        rethrow;
      }
    }catch (error) {
      emit(SignupFailure(error: error.toString()));
      rethrow;
    }
  }
  }

