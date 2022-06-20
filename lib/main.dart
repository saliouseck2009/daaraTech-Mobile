import 'package:auth_template/routeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth.dart';
import 'features/auth/presentation/bussiness_logic/bloc/signup_bloc/signup_bloc.dart';
import 'features/auth/data/repository/repositories.dart';
import 'features/auth/presentation/screen/login_screen.dart';
import 'features/main-page.dart';
import 'locator.dart';
import 'themes/theme.dart';

Future<void> main() async {
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) {
              return AuthenticationBloc()..add(AppStarted());
            },
          ),
          BlocProvider(
            create: (context) =>
                SignupBloc(userRepository: context.read<UserRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('mn', 'MN'),
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: ThemeData(
            fontFamily: 'Rubik',
            primarySwatch: Colors.green,
          ),
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                return const MainPage();
              }
              if (state is AuthenticationUnauthenticated) {
                //return IntroPage(userRepository: userRepository);
                return const LoginScreen();
              }
              if (state is AuthenticationLoading) {
                return Scaffold(
                  body: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                CustomColors.mainColor),
                            strokeWidth: 4.0,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Scaffold(
                body: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              CustomColors.mainColor),
                          strokeWidth: 4.0,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
