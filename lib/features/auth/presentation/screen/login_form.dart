import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/loading_widget.dart';
import '../../../../themes/theme.dart';
import '../../bussiness_logic/bloc/login_bloc/login.dart';
import '../../bussiness_logic/bloc/login_bloc/login_state.dart';
import '../../bussiness_logic/bloc/signup_bloc/signup_bloc.dart';
import '../../data/repository/repositories.dart';
import 'signup_screen.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
  });
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  _LoginFormState();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    Widget LoginButton() {
      return RaisedButton(
          color: CustomColors.mainColor,
          disabledColor: CustomColors.mainColor,
          disabledTextColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: _onLoginButtonPressed,
          child: Text("LOG IN",
              style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          errorNotification(context, state);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
            child: Form(
              child: ListView(
                children: [
                  Container(
                      //height: 200.0,
                      //padding: EdgeInsets.only(bottom: 20.0, top: 40.0),
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                  )),
                  SizedBox(
                    height: 30.0,
                  ),
                  _usernameTextFormField(
                      usernameController: _usernameController),
                  SizedBox(
                    height: 20.0,
                  ),
                  passwordTextFormField(
                      passwordController: _passwordController),
                  SizedBox(
                    height: 30.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: new InkWell(
                        child: new Text(
                          "Forget password?",
                          style:
                              TextStyle(color: Colors.black45, fontSize: 12.0),
                        ),
                        onTap: () {}),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                            height: 45,
                            child: state is LoginLoading
                                ? LoadingWidget()
                                : LoginButton()),
                      ],
                    ),
                  ),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Or connect using",
                        style: TextStyle(color: Colors.black26, fontSize: 12.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.0,
                        width: 180.0,
                        child: RaisedButton(
                            color: Color(0xFF385c8e),
                            disabledColor: Style.Colors.mainColor,
                            disabledTextColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text("Facebook",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            )),
                      ),
                      Container(
                        width: 180.0,
                        height: 40.0,
                        child: RaisedButton(
                            color: Color(0xFFf14436),
                            disabledColor: Style.Colors.mainColor,
                            disabledTextColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.google,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text("Google",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            )),
                      ),
                    ],
                  ),*/
                  SizedBox(
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
                            children: <Widget>[
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: CustomColors.grey),
                              ),
                              Padding(
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
                                  child: Text(
                                    "Register",
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

  void errorNotification(BuildContext context, var state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Login failed."),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class passwordTextFormField extends StatelessWidget {
  const passwordTextFormField({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontSize: 14.0,
          color: CustomColors.titleColor,
          fontWeight: FontWeight.bold),
      controller: _passwordController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.lock_outline, color: CustomColors.mainColor),
        enabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "Password",
        hintStyle: TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
        labelStyle: TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
      obscureText: true,
    );
  }
}

class _usernameTextFormField extends StatelessWidget {
  const _usernameTextFormField({
    Key? key,
    required TextEditingController usernameController,
  })  : _usernameController = usernameController,
        super(key: key);

  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontSize: 14.0,
          color: CustomColors.mainColor,
          fontWeight: FontWeight.bold),
      controller: _usernameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: CustomColors.mainColor),
        enabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: CustomColors.mainColor),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "Username",
        hintStyle: TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
        labelStyle: TextStyle(
            fontSize: 12.0,
            color: CustomColors.mainColor,
            fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
    );
  }
}
