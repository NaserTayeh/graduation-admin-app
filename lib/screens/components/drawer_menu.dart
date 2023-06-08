import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/controllers/gym_provider.dart';
import 'package:admin_dashboard/screens/majdy/GymConfigPage/gymconf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../majdy/CoachesPage/CoachesPage.dart';
import '../majdy/DashboardPage/Dashboard.dart';
import '../majdy/DashboardPage/components/graphbody.dart';
import '../majdy/FormatPage/formatpage.dart';
import '../majdy/PrimaryPage/Home.dart';
import '../majdy/Primarypage.dart';
import '../majdy/SettingPage/setting.dart';
import '../majdy/TraineePage/trainee.dart';
import '../majdy/table_screen.dart';
import 'drawer_list_tile.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      return Drawer(
        child: ListView(
          children: [
            Container(
              // padding: EdgeInsets.all(appPadding),
              child: Image.asset(
                "assets/NITRO GYM Logo (2).png",
                width: 400,
                height: 200,
              ),
            ),
            DrawerListTile(
                title: 'DB Tables',
                svgSrc: 'assets/icons/Dashboard.svg',
                tap: () async {
                  await provider.getAllTrainee();
                  await provider.getAllCoach();
                  await provider.getAllRecipe();
                  await provider.getAllMarketItems();

                  Get.to(AdminPage());
                }),
            DrawerListTile(
                title: 'Gym Info',
                svgSrc: 'assets/icons/BlogPost.svg',
                tap: () async {
                  GymProvider gymProvider =
                      Provider.of<GymProvider>(context, listen: false);
                  await gymProvider.getGymInfo();
                  gymProvider.setControllers(
                      gymabout: gymProvider.gymModel!.about!,
                      gymDesc: gymProvider.gymModel!.gymDesc!,
                      gymEmail: gymProvider.gymModel!.email!,
                      gymName: gymProvider.gymModel!.name!);

                  Get.to(const ConfigratuionGymPage());
                }),
            DrawerListTile(
                title: 'Statics',
                svgSrc: 'assets/icons/BlogPost.svg',
                tap: () {
                  Get.to(const ChartGrapfhBody());
                }),
            DrawerListTile(
                title: 'Quick Access',
                svgSrc: 'assets/icons/Message.svg',
                tap: () {
                  Get.to(Home());
                }),
            DrawerListTile(
                title: 'Coaches',
                svgSrc: 'assets/icons/Statistics.svg',
                tap: () async {
                  await provider.getAllCoach();
                  await provider.getAcceptedCoaches();
                  await provider.getDiabledCoaches();
                  await provider.getPendingCoaches();

                  Get.to(CoachesPage(
                    title: '',
                  ));
                }),
            DrawerListTile(
                title: 'Trainee',
                svgSrc: 'assets/icons/Statistics.svg',
                tap: () async {
                  await provider.getAllTrainee();
                  Get.to(TraineeScreen());
                }),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: appPadding * 2),
              child: Divider(
                color: grey,
                thickness: 0.2,
              ),
            ),
            DrawerListTile(
                title: 'Admin Settings',
                svgSrc: 'assets/icons/Setting.svg',
                tap: () async {
                  AuthProvider provider = Provider.of(context, listen: false);
                  await provider.getAdminInfo();
                  await provider.setControllers(
                      adminName: AuthProvider.loggedInAdmin!.userName!,
                      adminEmail: AuthProvider.loggedInAdmin!.email!,
                      adminPass: AuthProvider.loggedInAdmin!.password!,
                      adminPhone: AuthProvider.loggedInAdmin!.phoneNumber!);
                  Get.to(const SettingScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 200));
                }),
            DrawerListTile(
                title: 'Logout', svgSrc: 'assets/icons/Logout.svg', tap: () {}),
          ],
        ),
      );
    });
  }
}
