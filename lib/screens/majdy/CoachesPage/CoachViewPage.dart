import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/linkapi.dart';
import 'package:admin_dashboard/models/coach_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/responsive_widget.dart';
import '../../flip_widget.dart';

class User {
  final String name;
  final String email;
  final String password;
  final String profileImageUrl;

  const User({
    required this.name,
    required this.email,
    required this.password,
    required this.profileImageUrl,
  });
}

final List<User> users = [
  const User(
    name: 'John Doe',
    email: 'johndoe@example.com',
    password: "admin",
    profileImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
  ),
  const User(
    name: 'Jane Doe',
    email: 'janedoe@example.com',
    password: "admin",
    profileImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSubyqoUfvItU62z8iRCd0aV0IBI3KLQs3CZA&usqp=CAU',
  ),
  const User(
    name: 'Bob Smith',
    email: 'bobsmith@example.com',
    password: "admin",
    profileImageUrl:
        'https://cdn.dribbble.com/users/282014/screenshots/6857344/kenau_reeves-02_copy_4x.png?compress=1&resize=400x300&vertical=top',
  ),
];

class coachviewpage extends StatelessWidget {
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
                  itemCount: provider.allPendingCoach.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FlippingWidget(
                      frontContent: CoachRequestWidget(
                          user: provider.allPendingCoach[index]),
                      backContent: Transform(
                        transform:
                            Matrix4.rotationY(180 * (3.1415926535897932 / 180)),
                        alignment: Alignment.center,
                        child: FlippedCoachRequestWidget(
                            user: provider.allPendingCoach[index]),
                      ),
                    );
                  },
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: provider.allPendingCoach.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CoachRequestWidget(
                        user: provider.allPendingCoach[index]);
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
                            await provider.deleteCoach(user);
                            await provider.getAllCoach();
                            // call api
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
                            await provider.unPendCoach(user);
                            await provider.getAllCoach();
                            // call api
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

class FlippedCoachRequestWidget extends StatelessWidget {
  const FlippedCoachRequestWidget({
    super.key,
    required this.user,
  });

  final CoachModel user;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      return Container(
        height: 300,
        margin: EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
              },
              children: [
                _buildTableRow('Name', user.fullName!),
                _buildTableRow('Height', user.height!),
                _buildTableRow('Weight', user.weight!),
                _buildTableRow(
                    'Years of Experience', user.yearOfExp!.toString()),
                _buildTableRow('Age', user.age!.toString()),
                _buildTableRow('Coaching Focus', user.coachingFoucs!),
                _buildTableRow('Gender', user.gender!),
                _buildTableRow('Salary', user.salary!),
                _buildTableRow(
                    'Capacity of Trainee', user.numOfTrainee!.toString()),
              ],
            ),
          ),
        ),
      );
    });
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
          margin: EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }
}

class CoachInfoWidget extends StatelessWidget {
  final CoachModel coachModel;

  CoachInfoWidget({required this.coachModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      constraints: BoxConstraints(maxHeight: 180),
      child: SingleChildScrollView(
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          children: [
            _buildTableRow('Name', coachModel.fullName!),
            _buildTableRow('Height', coachModel.height!),
            _buildTableRow('Weight', coachModel.weight!),
            _buildTableRow(
                'Years of Experience', coachModel.yearOfExp!.toString()),
            _buildTableRow('Age', coachModel.age!.toString()),
            _buildTableRow('Coaching Focus', coachModel.coachingFoucs!),
            _buildTableRow('Gender', coachModel.gender!),
            _buildTableRow('Salary', coachModel.salary!),
            _buildTableRow(
                'Capacity of Trainee', coachModel.numOfTrainee!.toString()),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
