import 'package:auth_template/features/daara/presentation/bussiness_logic/nav_bottom_cubit.dart';
import 'package:auth_template/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../quran/data/repositories/sourate_list_repo.dart';
import '../../../quran/presentation/bussiness_logic/cubit/list_sourate_cubit.dart';
import '../../../quran/presentation/screens/sourate_list.dart';

class DaaraScreen extends StatelessWidget {
  static const routeName = "/daara";
  const DaaraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatelessWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ListSourate(optionStyle: optionStyle),

    ListEleve(optionStyle: optionStyle),
    // Text(
    //   'Index 2: School',
    //   style: optionStyle,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBottomCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Daara-Sourate'),
          ),
          body: Center(
            child: _widgetOptions.elementAt(state),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.school),
              //   label: 'School',
              // ),
            ],
            currentIndex: state,
            selectedItemColor: CustomColors.secondaryColor,
            onTap: (index) {
              BlocProvider.of<NavBottomCubit>(context).switchOnglet(index);
            },
          ),
        );
      },
    );
  }
}

class ListEleve extends StatelessWidget {
  const ListEleve({
    Key? key,
    required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 1: Business',
      style: optionStyle,
    );
  }
}

class ListSourate extends StatelessWidget {
  const ListSourate({
    Key? key,
    required this.optionStyle,
  }) : super(key: key);

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ListSourateCubit(sourateListRepo: context.read<SourateListRepo>())
            ..getSourateList(isReverse: false),
      child: SourateList(),
    );
  }
}
