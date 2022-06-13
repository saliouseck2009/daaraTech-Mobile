import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String? email;
  final String? password;

  const LoginButtonPressed({
    required this.email,
    required this.password,
  });

  @override
  String toString() =>
      'LoginButtonPressed { email: $email, password: $password }';

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
