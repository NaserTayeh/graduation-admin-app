import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../linkapi.dart';
import '../../../models/coach_model.dart';
import '../../auth/responsive_widget.dart';
import 'EditingPage.dart';

class EditCoach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0.0,
          ),
          body: ResponsiveWidget.isSmallScreen(context)
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: provider.allAcceptedCoach.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CoachCardWidget(
                        index: index, user: provider.allAcceptedCoach[index]);
                  },
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: provider.allAcceptedCoach.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CoachCardWidget(
                        index: index, user: provider.allAcceptedCoach[index]);
                  },
                ));
    });
  }
}

List data = [
  'Nutrition coaches',
  'Body Building',
  'Rehabilitation specialists',
  'Strength and conditioning coach',
];

class CoachCardWidget extends StatelessWidget {
  const CoachCardWidget({
    super.key,
    required this.user,
    required this.index,
  });

  final CoachModel user;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      return Container(
        margin: ResponsiveWidget.isSmallScreen(context)
            ? EdgeInsets.all(40)
            : EdgeInsets.all(50),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      imageUrl: "${AppLink.server}${user.personalPic!}",
                      placeholder: (context, url) => Center(
                          child: SpinKitRipple(
                        color: Colors.blue,
                        size: 50.0,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user.fullName!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  data[index! % 4],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                // Text(
                //   "Body Building ",
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: Colors.grey[600],
                //   ),
                // ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Status"),
                    SizedBox(width: 8.0),
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 15,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await provider.diabledCoach(user);
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber),
                      ),
                      child: Icon(Icons.close), // Add an icon to the button.,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await provider.deleteCoach(user);

                        // Handle  edit button press navigate to edit page
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: Icon(Icons.delete), // Add an icon to the button.,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
