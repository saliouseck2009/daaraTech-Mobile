import 'package:auth_template/features/daara/presentation/screen/daara_screen.dart';
import 'package:flutter/material.dart';

import '../auth/presentation/widgets/common_appbar.dart';
import '../auth/presentation/widgets/dashboard_card.dart';
import '../auth/presentation/widgets/drawer.dart';
import '../auth/presentation/widgets/user_detail_card.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/home";
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        //  elevation: 0,
        //backgroundColor: CustomColors.mainColor,
        child: MainDrawer(),
      ),
      appBar: CommonAppBar(
        menuenabled: true,
        notificationenabled: true,
        ontap: () {
          // _scaffoldKey.currentState.openDrawer();
        },
        title: "E-Daara",
      ),
      //appBar: AppBar(title: const Text("Titre")),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        children: [
          UserDetailCard(),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DashboardCard(
                onTap: () => Navigator.popAndPushNamed(
                  context,
                  MainPage.routeName,
                ),
                name: "Classes",
                imgpath: "classroom.png",
              ),
              DashboardCard(
                name: "Daara",
                imgpath: "quran.png",
                onTap: () =>
                    Navigator.pushNamed(context, DaaraScreen.routeName),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DashboardCard(
                name: "Personnels",
                imgpath: "profile.png",
                onTap: () {},
              ),
              DashboardCard(
                name: "Eléves",
                imgpath: "student.png",
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DashboardCard(
                name: "Finances",
                imgpath: "fee.png",
                onTap: () {},
              ),
              DashboardCard(
                name: "Support",
                imgpath: "support.png",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
