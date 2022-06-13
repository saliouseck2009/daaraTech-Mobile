import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/main-page.dart';
import '../themes/theme.dart';
import 'constant.dart';

class DrawerStyle extends StatelessWidget {
  DrawerStyle({Key? key}) : super(key: key);
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: <Widget>[
              _createHeader(),
              const Divider(),
              _createDrawerItem(
                  icon: Icons.view_list,
                  text: 'Listes des appareils',
                  onTap: () => Navigator.pushReplacementNamed(
                      context, MainPage.routeName)),
            ],
          ),
          const ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              title: Text(
                appVersion,
                style: TextStyle(color: CustomColors.mainColor),
              )),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(color: CustomColors.mainColor),
        //decoration: BoxDecoration(
        // image: DecorationImage(
        //     fit: BoxFit.fill,
        //     image:  AssetImage('path/to/header_background.png'))),
        child: Stack(children: const [
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(appliName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: CustomColors.mainColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text!,
              style: const TextStyle(color: CustomColors.mainColor),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
