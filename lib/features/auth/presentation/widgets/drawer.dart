import 'package:auth_template/features/auth/presentation/screen/login_form.dart';
import 'package:auth_template/features/daara/main-page.dart';
import 'package:flutter/material.dart';

import '../../../../themes/theme.dart';
import '../screen/login_screen.dart';
import 'drawer_list_tyle.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomDrawerHeader(),
        DrawerListTile(
            imgpath: "home.png",
            name: "Home",
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const MainPage(),
                ),
              );
            }),
        // DrawerListTile(
        //   imgpath: "attendance.png",
        //   name: "Attendance",
        //   ontap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (BuildContext context) => Attendance(),
        //       ),
        //     );
        //   },
        // ),
        // DrawerListTile(
        //     imgpath: "classroom.png", name: "Class work", ontap: () {}),
        // DrawerListTile(
        //     imgpath: "profile.png",
        //     name: "Profile",
        //     ontap: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (BuildContext context) => MainPage(),
        //         ),
        //       );
        //     }),
        // DrawerListTile(
        //   imgpath: "classroom.png",
        //   name: "Internal Mark",
        //   ontap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (BuildContext context) => MainPage(),
        //       ),
        //     );
        //   },
        // ),
        // // DrawerListTile(imgpath: "fee.png", name: "Fees", ontap: () {}),
        // DrawerListTile(
        //     imgpath: "calendar.png",
        //     name: "Time Table",
        //     ontap: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (BuildContext context) => MainPage(),
        //         ),
        //       );
        //     }),
        // DrawerListTile(
        //     imgpath: "meet.png",
        //     name: "Online Class",
        //     ontap: () async {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (BuildContext context) => MainPage(),
        //           ));
        //     }),

        // DrawerListTile(
        //     imgpath: "library.png",
        //     name: "Assignments",
        //     ontap: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (BuildContext context) => MainPage(),
        //         ),
        //       );
        //     }),
        // DrawerListTile(
        //     imgpath: "book.png",
        //     name: "Study Materials",
        //     ontap: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (BuildContext context) => MainPage(),
        //         ),
        //       );
        //     }),
        // // DrawerListTile(imgpath: "downloads.png", name: "Downloads"),
        // // DrawerListTile(imgpath: "bus.png", name: "Track ", ontap: () {}),
        // DrawerListTile(
        //   imgpath: "message.png",
        //   name: "Feedback",
        //   ontap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (BuildContext context) => MainPage(),
        //       ),
        //     );
        //   },
        // ),
        DrawerListTile(
            imgpath: "exit.png",
            name: "Logout",
            ontap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.routeName, (route) => false);
            }),
        // DrawerListTile(
        //     imgpath: "notification.png", name: "Notification", ontap: () {}),
      ],
    );
  }
}

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      child: SizedBox.shrink(),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/DaaraScience.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
