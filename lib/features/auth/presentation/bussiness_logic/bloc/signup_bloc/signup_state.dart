import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class SignupState extends Equatable {
  const SignupState();
  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final String reponse;
  const SignupSuccess({required this.reponse});
  @override
  List<Object> get props => [reponse];
}

class SignupFailure extends SignupState {
  final String error;
  const SignupFailure({required this.error});
  @override
  List<Object> get props => [error];
}
