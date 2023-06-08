import 'dart:io';
import 'package:admin_dashboard/controllers/gym_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../map.dart';

class ConfigratuionGymPage extends StatefulWidget {
  const ConfigratuionGymPage({Key? key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<ConfigratuionGymPage> {
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

  final _formKey = GlobalKey<FormState>();
  String? Name;
  String? gym_desc;
  String? Location;
  String? email;
  String? about;

  @override
  Widget build(BuildContext context) {
    return Consumer<GymProvider>(builder: (context, provider, w) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    "Edit Gym Detail's",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
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
                                    leading: Icon(Icons.camera_alt),
                                    title: Text('Take a photo'),
                                    onTap: () {
                                      provider.getImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo_library),
                                    title: Text('Choose from gallery'),
                                    onTap: () {
                                      provider.getImage(ImageSource.gallery);
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
                        // backgroundImage:
                        //     _image != null ? FileImage(_image!) : null,
                        child: provider.selectedImg == null
                            ? Icon(
                                Icons.person,
                                size: 50,
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: Image.file(
                                    provider.selectedImg!,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Column(
                                    children: const [
                                      Text(
                                        "Gym Logo",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
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
                  ],
                ),
                TextFormField(
                  controller: provider.gymEmail,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  onSaved: (value) => email = value,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: provider.gymName,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(labelText: 'Name'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                  onSaved: (value) => Name = value,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: provider.gymDesc,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(labelText: 'Gym Desc'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Gym Desc ';
                    }
                    return null;
                  },
                  onSaved: (value) => gym_desc = value,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(labelText: 'Location'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Location';
                          }
                          return null;
                        },
                        onSaved: (value) => Location = value,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.to(MapHome());
                        },
                        icon: Icon(
                          Icons.map,
                          color: Colors.greenAccent,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: provider.gymabout,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(labelText: 'About'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your About';
                    }
                    return null;
                  },
                  onSaved: (value) => about = value,
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await provider.updateGymInfo();
                      // Handle form submission
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
