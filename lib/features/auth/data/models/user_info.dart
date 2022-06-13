import 'dart:developer';

import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  String token;
  String id;
  UserInfo({required this.id, required this.token});

  String get getToken {
    return this.token;
  }

  void set setToken(String token) {
    this.token = token;
  }

  String get getId {
    return this.id;
  }

  void set setId(String id) {
    this.id = id;
  }

  @override
  // TODO: implement props
  List<Object> get props => [token, id];
}
