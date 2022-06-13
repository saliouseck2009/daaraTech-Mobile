import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/loading_widget.dart';
import '../../../../themes/theme.dart';
import '../../bussiness_logic/bloc/signup_bloc/signup.dart';
import '../../data/repository/repositories.dart';

class SignupForm extends StatefulWidget {
  final UserRepository userRepository;
  SignupForm({required this.userRepository});

  @override
  State<SignupForm> createState() => _SignupFormState(userRepository);
}

class _SignupFormState extends State<SignupForm> {
  final UserRepository userRepository;
  _SignupFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _chipIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onSignupButtonPressed() {
      BlocProvider.of<SignupBloc>(context).add(
        SignupButtonPressed(
            email: _emailController.text,
            password: _passwordController.text,
            username: _usernameController.text,
            phone: _phoneController.text,
            chipId: _chipIdController.text),
      );
    }

    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Incription échoué "),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Inscription réussi'),
            backgroundColor: Colors.green,
          ));
          return Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
            child: Form(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/baj3n.png'),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Connectez vous",
                        style: TextStyle(
                            fontSize: 10.0, color: CustomColors.mainColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _usernameTextFormField(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _chipIdTextFormField(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _emailTextFormField(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _passwordTextFormField(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _phoneTextFormField(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                            height: 45,
                            child: state is SignupLoading
                                ? const LoadingWidget()
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: CustomColors.mainColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        )),
                                    onPressed: _onSignupButtonPressed,
                                    child: Text("Creer un compte",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(color: CustomColors.grey),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Connexion",
                                    style: TextStyle(
                                        color: CustomColors.mainColor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  TextFormField _usernameTextFormField() {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0,
          color: CustomColors.mainColor,
          fontWeight: FontWeight.bold),
      controller: _usernameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.login, color: CustomColors.mainColor),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "Username",
        hintStyle: const TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
    );
  }

  TextFormField _chipIdTextFormField() {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0,
          color: CustomColors.mainColor,
          fontWeight: FontWeight.bold),
      controller: _chipIdController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.login, color: CustomColors.mainColor),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "ID appareil",
        hintStyle: const TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
    );
  }

  TextFormField _emailTextFormField() {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0,
          color: CustomColors.mainColor,
          fontWeight: FontWeight.bold),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon:
            const Icon(Icons.email_rounded, color: CustomColors.mainColor),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "E-Mail",
        hintStyle: const TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
    );
  }

  TextFormField _passwordTextFormField() {
    return TextFormField(
      style: TextStyle(
          fontSize: 14.0,
          color: CustomColors.mainColor,
          fontWeight: FontWeight.bold),
      controller: _passwordController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: const Icon(
          Icons.lock,
          color: CustomColors.mainColor,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "Mot de Passe",
        hintStyle: const TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
      obscureText: true,
    );
  }

  TextFormField _phoneTextFormField() {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0,
          color: CustomColors.mainColor,
          fontWeight: FontWeight.bold),
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone, color: CustomColors.mainColor),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "Téléphone",
        hintStyle: const TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
    );
  }
}
