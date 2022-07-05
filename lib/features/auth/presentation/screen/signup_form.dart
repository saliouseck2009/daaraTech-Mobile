import 'dart:developer';

import 'package:auth_template/features/auth/presentation/widgets/utils_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';

import '../../../../shared/widgets/loading_widget.dart';
import '../../../../themes/theme.dart';
import '../../presentation/bussiness_logic/bloc/signup_bloc/signup.dart';
import '../widgets/custom_text_form_field.dart';

class SignupForm extends StatelessWidget {
  SignupForm({Key? key}) : super(key: key);
  final _formKeySignUp = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  _onSignupButtonPressed(
      {required BuildContext context, required GlobalKey<FormState> key}) {
    log("TRIGGERED");
    if (key.currentState!.validate()) {
      BlocProvider.of<SignupBloc>(context).add(
        SignupButtonPressed(
          email: _emailController.text,
          password: _passwordController.text,
          username: _usernameController.text,
          phone: _phoneController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
            UtilsScreen.CustomSnackbar(context: context, description: state.error, colorBackground: CustomColors.red, textType: 'Error',);
        } else if (state is SignupSuccess) {
          Navigator.pop(context);
          UtilsScreen.CustomSnackbar(context: context, description: "incription effectuée avec succés", colorBackground: CustomColors.successGreen, textType: 'Succes',);
        }
      },
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
            child: Form(
              key: _formKeySignUp,
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
                        "Connectez - vous",
                        style: TextStyle(
                            fontSize: 25.0, color: CustomColors.mainColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomTextFormField(
                    icon:
                        const Icon(Icons.email, color: CustomColors.mainColor),
                    keyboardType: TextInputType.text,
                    label: "Email",
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    validator: (valueInput) {
                      if (valueInput!.isEmpty) {
                        return 'Veillez entrer votre email';
                      } else if (!valueInput.isEmail) {
                        return 'Veillez saisir un Email valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  //_passwordTextFormField(),
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
                    height: 20.0,
                  ),
                  // _phoneTextFormField(),
                  CustomTextFormField(
                    icon:
                        const Icon(Icons.phone, color: CustomColors.mainColor),
                    keyboardType: TextInputType.number,
                    label: "Téléphone",
                    controller: _phoneController,
                    textInputAction: TextInputAction.done,
                    validator: (valueInput) {
                      if (valueInput!.isEmpty) {
                        return 'Veillez entrer votre numéro de téléphone';
                      } else if (!valueInput.isPhoneNumber) {
                        return 'Veillez saisir un numéro de téléphone valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
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
                                              BorderRadius.circular(5.0),
                                        )),
                                    onPressed: () => _onSignupButtonPressed(
                                        key: _formKeySignUp, context: context),
                                    child: const Text("Creer un compte",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)))),
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
                  const SizedBox(
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

  // TextFormField _usernameTextFormField() {
  //   return TextFormField(
  //     style: const TextStyle(
  //         fontSize: 14.0,
  //         color: CustomColors.mainColor,
  //         fontWeight: FontWeight.bold),
  //     controller: _usernameController,
  //     keyboardType: TextInputType.text,
  //     decoration: InputDecoration(
  //       prefixIcon: const Icon(Icons.login, color: CustomColors.mainColor),
  //       enabledBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(color: CustomColors.mainColor),
  //           borderRadius: BorderRadius.circular(30.0)),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(color: CustomColors.mainColor),
  //           borderRadius: BorderRadius.circular(30.0)),
  //       contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
  //       labelText: "Username",
  //       hintStyle: const TextStyle(
  //           fontSize: 12.0,
  //           color: CustomColors.mainColor,
  //           fontWeight: FontWeight.w500),
  //       labelStyle: const TextStyle(
  //           fontSize: 12.0,
  //           color: CustomColors.mainColor,
  //           fontWeight: FontWeight.w500),
  //     ),
  //     autocorrect: false,
  //   );
  // }
  //
  // TextFormField _chipIdTextFormField() {
  //   return TextFormField(
  //     style: const TextStyle(
  //         fontSize: 14.0,
  //         color: CustomColors.mainColor,
  //         fontWeight: FontWeight.bold),
  //     controller: _chipIdController,
  //     keyboardType: TextInputType.text,
  //     decoration: InputDecoration(
  //       prefixIcon: const Icon(Icons.login, color: CustomColors.mainColor),
  //       enabledBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(color: CustomColors.mainColor),
  //           borderRadius: BorderRadius.circular(30.0)),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(color: CustomColors.mainColor),
  //           borderRadius: BorderRadius.circular(30.0)),
  //       contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
  //       labelText: "ID appareil",
  //       hintStyle: const TextStyle(
  //           fontSize: 12.0,
  //           color: CustomColors.mainColor,
  //           fontWeight: FontWeight.w500),
  //       labelStyle: const TextStyle(
  //           fontSize: 12.0,
  //           color: CustomColors.mainColor,
  //           fontWeight: FontWeight.w500),
  //     ),
  //     autocorrect: false,
  //   );
  // }
  //
  // TextFormField _emailTextFormField() {
  //   return TextFormField(
  //     style: const TextStyle(
  //         fontSize: 14.0,
  //         color: CustomColors.mainColor,
  //         fontWeight: FontWeight.bold),
  //     controller: _emailController,
  //     keyboardType: TextInputType.emailAddress,
  //     decoration: InputDecoration(
  //       prefixIcon:
  //           const Icon(Icons.email_rounded, color: CustomColors.mainColor),
  //       enabledBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(color: CustomColors.mainColor),
  //           borderRadius: BorderRadius.circular(30.0)),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(color: CustomColors.mainColor),
  //           borderRadius: BorderRadius.circular(30.0)),
  //       contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
  //       labelText: "E-Mail",
  //       hintStyle: const TextStyle(
  //           fontSize: 12.0,
  //           color: CustomColors.mainColor,
  //           fontWeight: FontWeight.w500),
  //       labelStyle: const TextStyle(
  //           fontSize: 12.0,
  //           color: CustomColors.mainColor,
  //           fontWeight: FontWeight.w500),
  //     ),
  //     autocorrect: false,
  //   );
  // }
  //
  // TextFormField _passwordTextFormField() {
  //   return TextFormField(
  //     style: TextStyle(
  //         fontSize: 14.0,
  //         color: CustomColors.mainColor,
  //         fontWeight: FontWeight.bold),
  //     controller: _passwordController,
  //     decoration: InputDecoration(
  //       fillColor: Colors.white,
  //       prefixIcon: const Icon(
  //         Icons.lock,
  //         color: CustomColors.mainColor,
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(color: CustomColors.mainColor),
  //           borderRadius: BorderRadius.circular(30.0)),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(color: CustomColors.mainColor),
  //           borderRadius: BorderRadius.circular(30.0)),
  //       contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
  //       labelText: "Mot de Passe",
  //       hintStyle: const TextStyle(
  //           fontSize: 12.0,
  //           color: CustomColors.mainColor,
  //           fontWeight: FontWeight.w500),
  //       labelStyle: const TextStyle(
  //           fontSize: 12.0,
  //           color: CustomColors.mainColor,
  //           fontWeight: FontWeight.w500),
  //     ),
  //     autocorrect: false,
  //     obscureText: false,
  //   );
  // }
  //
  // TextFormField _phoneTextFormField() {
  //   return TextFormField(
  //     style: const TextStyle(
  //         fontSize: 14.0,
  //         color: CustomColors.mainColor,
  //         fontWeight: FontWeight.bold),
  //     controller: _phoneController,
  //     keyboardType: TextInputType.phone,
  //     decoration: InputDecoration(
  //       prefixIcon: const Icon(Icons.phone, color: CustomColors.mainColor),
  //       border: const OutlineInputBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(5)),
  //           borderSide: BorderSide(color: CustomColors.mainColor)),
  //       enabledBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(color: CustomColors.mainColor),
  //           borderRadius: BorderRadius.circular(30.0)),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(color: CustomColors.mainColor),
  //           borderRadius: BorderRadius.circular(30.0)),
  //       contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
  //       labelText: "Téléphone",
  //       hintStyle: const TextStyle(
  //           fontSize: 12.0,
  //           color: CustomColors.mainColor,
  //           fontWeight: FontWeight.w500),
  //       labelStyle: const TextStyle(
  //           fontSize: 12.0,
  //           color: CustomColors.mainColor,
  //           fontWeight: FontWeight.w500),
  //     ),
  //     autocorrect: false,
  //   );
  // }
}



