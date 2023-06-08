import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/linkapi.dart';
import 'package:admin_dashboard/models/trainee_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class User {
  final String name;
  final String email;
  final String profileImageUrl;

  const User({
    required this.name,
    required this.email,
    required this.profileImageUrl,
  });
}

List data = [
  'naser3@gmail.com',
  'naser5@gmail.com',
  'rayan@gmail.com',
  'sabm8366@gmail.com',
];

final List<User> users = [
  const User(
    name: 'John Doe',
    email: 'johndoe@example.com',
    profileImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
  ),
  const User(
    name: 'Jane Doe',
    email: 'janedoe@example.com',
    profileImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSubyqoUfvItU62z8iRCd0aV0IBI3KLQs3CZA&usqp=CAU',
  ),
  const User(
    name: 'Bob Smith',
    email: 'bobsmith@example.com',
    profileImageUrl:
        'https://cdn.dribbble.com/users/282014/screenshots/6857344/kenau_reeves-02_copy_4x.png?compress=1&resize=400x300&vertical=top',
  ),
];

class TraineeScreen extends StatefulWidget {
  @override
  State<TraineeScreen> createState() => _TraineeScreenState();
}

bool? getNotSubscribed = false;

class _TraineeScreenState extends State<TraineeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: () {
                if (getNotSubscribed!) {
                  getNotSubscribed = false;
                  setState(() {});
                } else {
                  getNotSubscribed = true;
                  setState(() {});
                }
              },
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    getNotSubscribed == false
                        ? 'Get Not Subscribed'
                        : 'Get All Trainee',
                    style: TextStyle(color: Colors.black),
                  )))
        ],
        title: Text(
          'Gym Trainee',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, w) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: getNotSubscribed == false
              ? provider.allTrainee.length
              : provider.notSubscribedTrainee.length,
          itemBuilder: (BuildContext context, int index) {
            // final user = users[index];
            return TraineeWidget(
                index: index,
                trainee: getNotSubscribed == false
                    ? provider.allTrainee[index]
                    : provider.notSubscribedTrainee[index]);

            // return Card(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       CircleAvatar(
            //         backgroundImage: NetworkImage(user.profileImageUrl),
            //         radius: 50,
            //       ),
            //       const SizedBox(height: 10),
            //       Text(
            //         user.name,
            //         style: const TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const SizedBox(height: 5),
            //       Text(
            //         user.email,
            //         style: TextStyle(
            //           fontSize: 16,
            //           color: Colors.grey[600],
            //         ),
            //       ),
            //       const SizedBox(height: 10),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           ElevatedButton(
            //             onPressed: () {
            //               // call api
            //             },
            //             style: ButtonStyle(
            //               backgroundColor:
            //                   MaterialStateProperty.all<Color>(Colors.red),
            //             ),
            //             child: Icon(Icons.delete), // Add an icon to the button.,
            //           ),
            //           ElevatedButton(
            //             onPressed: () {
            //               // call api
            //             },
            //             style: ButtonStyle(
            //               backgroundColor:
            //                   MaterialStateProperty.all<Color>(Colors.green),
            //             ),
            //             child: Icon(Icons.check), // Add an icon to the button.,
            //           ),
            //           ElevatedButton(
            //             onPressed: () {
            //               // Handle deactivate button press
            //             },
            //             style: ButtonStyle(
            //               foregroundColor:
            //                   MaterialStateProperty.all<Color>(Colors.white),
            //               backgroundColor:
            //                   MaterialStateProperty.all<Color>(Colors.amber),
            //             ),
            //             child: Icon(Icons.close), // Add an icon to the button.,
            //           ),
            //           ElevatedButton(
            //             onPressed: () {
            //               // Handle button press
            //             },
            //             child: Tooltip(
            //                 message: 'Click me for more information!',
            //                 child: Icon(Icons.info)),
            //           )
            //         ],
            //       )
            //     ],
            //   ),
            // );
          },
        );
      }),
    );
  }
}

class Trainee {
  late String name;
  late String email;
  late String photo;
  late bool isSubscribed;

  Trainee(
      {required this.name,
      required this.email,
      required this.photo,
      required this.isSubscribed});
}

void _showMessageDialog(BuildContext context) {
  final _messageController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Send Message'),
        content: TextField(
          controller: _messageController,
          decoration: InputDecoration(
            hintText: 'Enter your message here',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final message = _messageController.text;
              // TODO: send message to trainee
              Navigator.of(context).pop();
            },
            child: Text('Send'),
          ),
        ],
      );
    },
  );
}

class TraineeWidget extends StatefulWidget {
  final TraineeModel trainee;
  final int? index;

  TraineeWidget({required this.trainee, required this.index});

  @override
  _TraineeWidgetState createState() => _TraineeWidgetState();
}

class _TraineeWidgetState extends State<TraineeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            // backgroundImage:
            //     NetworkImage("${AppLink.server}${widget.trainee.personalPic!}" ),
            radius: 40.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 100,
                width: 100,
                imageUrl: "${AppLink.server}${widget.trainee.personalPic!}",
                placeholder: (context, url) => Center(
                    child: SpinKitRipple(
                  color: Colors.blue,
                  size: 50.0,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

              //  Image.network(
              //   "${AppLink.server}${widget.trainee.personalPic!}",
              //   fit: BoxFit.fitHeight,
              //   errorBuilder: (context, error, stackTrace) =>
              //       Icon(Icons.person),
              // ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.trainee.fullName!,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  data[widget.index!],
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    SizedBox(width: 8.0),
                    Container(
                      height: 12.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.trainee.isPrem == 1
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      widget.trainee.isPrem == 1
                          ? 'Subscribed'
                          : 'Not Subscribed',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: widget.trainee.isPrem == 1
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        _showMessageDialog(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 10,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Message',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // Container(
    //   padding: EdgeInsets.all(16.0),
    //   margin: EdgeInsets.symmetric(vertical: 8.0),
    //   decoration: BoxDecoration(
    //     color: Colors.grey[100],
    //     borderRadius: BorderRadius.circular(8.0),
    //   ),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       CircleAvatar(
    //         backgroundImage: NetworkImage(widget.trainee.photo),
    //         radius: 40.0,
    //       ),
    //       SizedBox(width: 16.0),
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               widget.trainee.name,
    //               style: TextStyle(
    //                 fontSize: 18.0,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             SizedBox(height: 4.0),
    //             Text(
    //               widget.trainee.email,
    //               style: TextStyle(
    //                 fontSize: 14.0,
    //                 color: Colors.grey[600],
    //               ),
    //             ),
    //             SizedBox(height: 16.0),
    //             Row(
    //               children: [
    //                 SizedBox(width: 8.0),
    //                 Container(
    //                   height: 12.0,
    //                   width: 12.0,
    //                   decoration: BoxDecoration(
    //                     shape: BoxShape.circle,
    //                     color: widget.trainee.isSubscribed
    //                         ? Colors.green
    //                         : Colors.red,
    //                   ),
    //                 ),
    //                 SizedBox(width: 4.0),
    //                 Text(
    //                   widget.trainee.isSubscribed
    //                       ? 'Subscribed'
    //                       : 'Not Subscribed',
    //                   style: TextStyle(
    //                     fontSize: 14.0,
    //                     fontWeight: FontWeight.bold,
    //                     color: widget.trainee.isSubscribed
    //                         ? Colors.green
    //                         : Colors.red,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    // Container(
    //   padding: EdgeInsets.all(16.0),
    //   margin: EdgeInsets.symmetric(vertical: 8.0),
    //   decoration: BoxDecoration(
    //     color: Colors.grey[100],
    //     borderRadius: BorderRadius.circular(8.0),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       CircleAvatar(
    //         backgroundImage: NetworkImage(widget.trainee.photo),
    //         radius: 40.0,
    //       ),
    //       SizedBox(height: 8.0),
    //       Text(
    //         widget.trainee.name,
    //         style: TextStyle(
    //           fontSize: 18.0,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       SizedBox(height: 4.0),
    //       Text(
    //         widget.trainee.email,
    //         style: TextStyle(
    //           fontSize: 14.0,
    //           color: Colors.grey[600],
    //         ),
    //       ),
    //       SizedBox(height: 16.0),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(
    //               widget.trainee.isSubscribed ? "Subscribed" : "Not Subscribed",
    //               style: TextStyle(
    //                 fontSize: 14.0,
    //                 fontWeight: FontWeight.bold,
    //               )),
    //           SizedBox(width: 8.0),
    //           Container(
    //             height: 12.0,
    //             width: 12.0,
    //             decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               color:
    //                   widget.trainee.isSubscribed ? Colors.green : Colors.red,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}

final List<Trainee> trainees = [
  Trainee(
      name: "John Doe",
      email: "john.doe@example.com",
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
      isSubscribed: true),
  Trainee(
      name: "Jane Doe",
      email: "jane.doe@example.com",
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
      isSubscribed: false),
  Trainee(
      name: "Bob Smith",
      email: "bob.smith@example.com",
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
      isSubscribed: true),
  Trainee(
      name: "John Doe",
      email: "john.doe@example.com",
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
      isSubscribed: true),
  Trainee(
      name: "Jane Doe",
      email: "jane.doe@example.com",
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
      isSubscribed: false),
  Trainee(
      name: "Bob Smith",
      email: "bob.smith@example.com",
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
      isSubscribed: true),
  Trainee(
      name: "John Doe",
      email: "john.doe@example.com",
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
      isSubscribed: true),
  Trainee(
      name: "Jane Doe",
      email: "jane.doe@example.com",
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
      isSubscribed: false),
  Trainee(
      name: "Bob Smith",
      email: "bob.smith@example.com",
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTYznUBtZn1s1Yl2fCXiX3M0ZxBQg1FXSu18DqOPbNYjLJD9PZuiuIgTF1_QvxOs1VlDU&usqp=CAU',
      isSubscribed: true),
];
