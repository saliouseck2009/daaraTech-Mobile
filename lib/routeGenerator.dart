import 'package:auth_template/features/auth/data/repository/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presentation/bussiness_logic/bloc/signup_bloc/signup_bloc.dart';
import 'features/auth/presentation/screen/signup_screen.dart';
import 'features/main-page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/signup':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignupBloc(
                      userRepository: context.read<UserRepository>()),
                  child: SignupScreen(),
                ));
      case MainPage.routeName:
        return MaterialPageRoute(builder: (_) => const MainPage());

      default:
        return MaterialPageRoute(builder: (_) => const MainPage());
    }
  }
}
