import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../auth/responsive_widget.dart';
import '../CoachesPage/CoachesPage.dart';
import '../FormatPage/formatpage.dart';
import '../GymConfigPage/gymconf.dart';
import '../SettingPage/setting.dart';
import '../TraineePage/trainee.dart';
import '../DashboardPage/Dashboard.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = Items(
      title: "Coache's",
      subtitle: "Coache's datalist",
      event: "3 Coache",
      img: "assets/Coache.png",
      widgetpage: CoachesPage(
        title: '',
      ));

  Items item2 = Items(
      title: "Trainee",
      subtitle: "Trainee Lists",
      event: "4 Trainee",
      img: "assets/trainee.png",
      widgetpage: TraineeScreen());

  Items item4 = Items(
      title: "Format System",
      subtitle: "Clear all the data in the system",
      event: "",
      img: "assets/format.png",
      widgetpage: const Format());
  Items item5 = Items(
      title: "Gym Configration",
      subtitle: "gym public data",
      event: "",
      img: "assets/config.png",
      widgetpage: const ConfigratuionGymPage());
  Items item6 = Items(
      title: "Settings",
      subtitle: "Personal Admin data",
      event: " ",
      img: "assets/setting.png",
      widgetpage: const SettingScreen());
  Items item7 = Items(
      title: "Dashboard",
      subtitle: "System analysis",
      event: " ",
      img: "assets/Dash.png",
      widgetpage: const Dashboard());

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item5, item6, item4, item7];
    var color = 0xffffff;
    return Flexible(
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        childAspectRatio: 1.0,
        padding: const EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: ResponsiveWidget.isSmallScreen(context) ? 2 : 6,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return Card(
            elevation: 5, // controls the depth of the shadow
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // sets the rounded corners
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // sets the rounded corners
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => data.widgetpage,
                        ),
                      );
                    },
                    child: Image.asset(
                      data.img,
                      width: 42,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Widget widgetpage;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img,
      required this.widgetpage});
}
