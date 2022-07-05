import 'package:auth_template/features/auth/presentation/widgets/utils_screen.dart';
import 'package:auth_template/features/main-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/loading_widget.dart';
import '../../../../themes/theme.dart';
import '../../presentation/bussiness_logic/bloc/login_bloc/login.dart';
import '../../presentation/bussiness_logic/bloc/signup_bloc/signup_bloc.dart';
import '../../data/repository/repositories.dart';
import '../widgets/custom_text_form_field.dart';
import 'signup_screen.dart';

class LoginForm extends StatelessWidget {
  final _formKeySignIn = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  _onLoginButtonPressed(
      {required BuildContext context, required GlobalKey<FormState> key}) {
    Navigator.pushReplacementNamed(context, MainPage.routeName);
    if (key.currentState!.validate()) {
      // BlocProvider.of<LoginBloc>(context).add(
      //   LoginButtonPressed(
      //     email: _usernameController.text,
      //     password: _passwordController.text,
      //   ),
      // );
    }
  }

  Widget LoginButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: CustomColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )),
        onPressed: () =>
            _onLoginButtonPressed(key: _formKeySignIn, context: context),
        child: const Text("Se Connecter",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            UtilsScreen.CustomSnackbar(
              context: context,
              description: state.error,
              colorBackground: CustomColors.red,
              textType: 'Error',
            );
          } else if (state is LoginSuccess) {
            UtilsScreen.CustomSnackbar(
              context: context,
              description: "User connecté avec succés",
              colorBackground: CustomColors.successGreen,
              textType: 'Success',
            );
            Navigator.pushReplacementNamed(context, MainPage.routeName);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
          child: Form(
            key: _formKeySignIn,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/DaaraScience.png'),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Connectez vous",
                      style: TextStyle(
                          fontSize: 30.0, color: CustomColors.mainColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomTextFormField(
                  icon: const Icon(Icons.person, color: CustomColors.mainColor),
                  keyboardType: TextInputType.text,
                  label: "Username",
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  validator: (valueInput) {
                    if (valueInput!.isEmpty) {
                      return 'Veillez entrer votre Pseudonyme';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextFormField(
                  icon: const Icon(Icons.lock_outline,
                      color: CustomColors.mainColor),
                  keyboardType: TextInputType.visiblePassword,
                  label: "Mot de Passe",
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  validator: (valueInput) {
                    if (valueInput!.isEmpty) {
                      return 'Veillez entrer votre mot de passe';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      child: const Text(
                        "Forget password?",
                        style: TextStyle(color: Colors.black45, fontSize: 12.0),
                      ),
                      onTap: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return SizedBox(
                              height: 45,
                              child: state is LoginLoading
                                  ? const LoadingWidget()
                                  : LoginButton(context));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: CustomColors.grey),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5.0),
                          ),
                          GestureDetector(
                              onTap: () {
                                //Navigator.of(context).pushNamed('/signup');
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return BlocProvider(
                                    create: (context) => SignupBloc(
                                        userRepository:
                                            context.read<UserRepository>()),
                                    child: SignupScreen(),
                                  );
                                }));
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    color: CustomColors.mainColor,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ));
  }
}
