import 'package:auth_template/features/auth/bussiness_logic/bloc/signup_bloc/signup_event.dart';
import 'package:auth_template/features/auth/bussiness_logic/bloc/signup_bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/repositories.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;
  SignupBloc({required this.userRepository}) : super(SignupInitial()) {
    on<SignupButtonPressed>((event, emit) => _signupButtonPressed(event, emit));
  }

  _signupButtonPressed(
      SignupButtonPressed event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    try {
      var response = await userRepository.signUp(
          username: event.username,
          password: event.password,
          chipId: event.chipId,
          email: event.email,
          phone: event.phone);
      String reponse = "inscription réussi";
      emit(SignupSuccess(reponse: reponse));
    } catch (error) {
      emit(SignupFailure(error: error.toString()));
    }
  }
}
