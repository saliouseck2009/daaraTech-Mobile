import 'package:flutter/material.dart';

import 'auth/presentation/widgets/common_appbar.dart';
import 'auth/presentation/widgets/dashboard_card.dart';
import 'auth/presentation/widgets/drawer.dart';
import 'auth/presentation/widgets/user_detail_card.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 20, 10),
                child: Container(
                  alignment: Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        DashboardCard(
                          name: "Daara",
                          imgpath: "quran.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 20, 10),
                child: Container(
                  alignment: Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        DashboardCard(
                          name: "Classes",
                          imgpath: "classroom.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 20, 10),
                child: Container(
                  alignment: const Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        DashboardCard(
                          name: "Personnels",
                          imgpath: "profile.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 20, 10),
                child: Container(
                  alignment: Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        DashboardCard(
                          name: "Eléves",
                          imgpath: "students.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 20, 10),
                child: Container(
                  alignment: Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        DashboardCard(
                          name: "Finances",
                          imgpath: "fee.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 20, 10),
                child: Container(
                  alignment: Alignment(1.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        DashboardCard(
                          name: "Support",
                          imgpath: "support.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
