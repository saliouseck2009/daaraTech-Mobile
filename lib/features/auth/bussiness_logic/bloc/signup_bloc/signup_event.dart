import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/editable_text.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignupButtonPressed extends SignupEvent {
  final String username;
  final String email;
  final String password;
  final String phone;
  final String chipId;

  const SignupButtonPressed(
      {required this.username,
      required this.email,
      required this.password,
      required this.phone,
      required this.chipId});

  @override
  // TODO: implement props
  List<Object> get props => [];
  @override
  String toString() =>
      'SignupButtonPressed {username: $username, phone: $phone, email: $email, chipId: $chipId }';
}




// class SignUpUsernameChanged extends SignUpEvent {
//   final String username;
//   SignUpUsernameChanged({this.username});
//   @override
//   List<Object> get props => [username];
// }

// class SignUpEmailChanged extends SignUpEvent {
//   final String email;
//   SignUpEmailChanged({this.email});
//   @override
//   List<Object> get props => [email];
// }

// class SignUpPasswordChanged extends SignUpEvent {
//   final String password;
//   SignUpPasswordChanged({this.password});
//   @override
//   List<Object> get props => [password];
// }

// class SignUpPhoneChanged extends SignUpEvent {
//   final String phone;
//   SignUpPhoneChanged({this.phone});
//   @override
//   List<Object> get props => [phone];
// }


