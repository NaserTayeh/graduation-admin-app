import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../auth/responsive_widget.dart';
import 'griddashboard.dart';

import 'dart:io';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);
    setState(() {
      try {
        _image = File(pickedImage!.path);
      } catch (e) {
        print("file Empty");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      return Scaffold(
        appBar: AppBar(),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Take a photo'),
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Choose from gallery'),
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          "${AppLink.server}${AuthProvider.loggedInAdmin!.personalPic!}",
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: ResponsiveWidget.isSmallScreen(context)
                  ? const EdgeInsets.only(left: 16, right: 16)
                  : const EdgeInsets.only(left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "${AuthProvider.loggedInAdmin!.userName!}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Control Page",
                                style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ),
                              // ElevatedButton(
                              //   onPressed: () {
                              //     // call api to save image
                              //   },
                              //   style: ButtonStyle(
                              //     backgroundColor:
                              //         MaterialStateProperty.all<Color>(
                              //             Colors.blue),
                              //   ),
                              //   child: const Text('Save Photo'),
                              // )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GridDashboard()
          ],
        ),
      );
    });
  }
}
