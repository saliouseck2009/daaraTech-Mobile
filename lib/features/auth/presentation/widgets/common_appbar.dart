import 'package:auth_template/features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth.dart';
import 'package:auth_template/features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool menuenabled;
  final bool notificationenabled;
  final Function()? ontap;
  const CommonAppBar({
    Key? key,
    required this.title,
    required this.menuenabled,
    required this.notificationenabled,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            Navigator.pop(context);
          },
          icon: Icon(Icons.logout),
          color: Colors.white,
          iconSize: 30,
        )
      ],
      centerTitle: true,
      // backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
