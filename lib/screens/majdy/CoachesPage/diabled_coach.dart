import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/models/coach_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../linkapi.dart';
import '../../auth/responsive_widget.dart';

class DisabledCoachPage extends StatelessWidget {
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
                  itemCount: provider.allDiabledCoach.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CoachRequestWidget(
                        user: provider.allDiabledCoach[index]);
                  },
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: provider.allDiabledCoach.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CoachRequestWidget(
                        user: provider.allDiabledCoach[index]);
                  },
                ));
    });
  }
}

class CoachRequestWidget extends StatelessWidget {
  const CoachRequestWidget({
    super.key,
    required this.user,
  });

  final CoachModel user;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      return Container(
        margin: EdgeInsets.all(40),
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
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage("${AppLink.server}${user.personalPic!}"),
                      radius: 50,
                    ),
                    SizedBox(height: 16),
                    Text(
                      user.fullName!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'user.email',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Password : " + 'user.password',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            // call api
                            await provider.deleteCoach(user);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          icon: Icon(Icons.delete),
                          label: Text(""),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            // call api
                            await provider.enabledCoach(user);
                            await provider.getAllCoach();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          icon: Icon(Icons.check),
                          label: Text(""),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Tooltip(
                message: "Request Date: 22/7/2022",
                child: IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  icon: Icon(
                    Icons.calendar_today,
                    size: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
