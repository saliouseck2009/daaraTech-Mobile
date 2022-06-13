import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable {
  final String? userName;
  String? email = "";
  final String? password;
  String? phone = "";

  User(
      {required this.userName, this.email, required this.password, this.phone});

  @override
  List<Object?> get props => [userName, password];
}
