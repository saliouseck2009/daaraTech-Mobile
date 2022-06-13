
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/home";
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center( child: Text("Bienvenue sur la page d'acceuil",
      style: Theme.of(context).textTheme.bodyMedium,
    ),);
  }
}
