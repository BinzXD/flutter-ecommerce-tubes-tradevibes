import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tubes_mobile/pages/orderpage.dart';
import 'package:tubes_mobile/pages/settingpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String userName = '';
  String email = '';
  String phone = '';
  String credit = '';
  String bahasa = '';
  String alamat = '';
  Uint8List? _image;
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final userData = await firebaseFirestore
        .collection('Users')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (userData.docs.isNotEmpty) {
      var userDocument = userData.docs[0];

      setState(() {
        userName = userDocument['username'];
        email = userDocument['email'];
        phone = userDocument['phone'];
        credit = userDocument['credit'];
        bahasa = userDocument['bahasa'];
        alamat = userDocument['alamat'];
      });
    } else {
      print('User data not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 25),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 60, backgroundImage: MemoryImage(_image!))
                    : const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/profil.jpg'),
                      ),
                Positioned(
                  bottom: 10,
                  right: 200,
                  child: Container(
                    width: 40,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white70,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          showImagePickerOption(context);
                        },
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(userName, style: Theme.of(context).textTheme.headline6),
          ),
          Center(
            child: Text(email, style: Theme.of(context).textTheme.subtitle1),
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("My Order"),
            leading: const Icon(Icons.shopping_bag),
            onTap: () {
              // Navigate to the OrdersPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrdersPage()),
              );
            },
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("About Us"),
            leading: const Icon(Icons.info),
            onTap: () {
              // Handle "About Us" tap
            },
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("Saved"),
            leading: const Icon(Icons.bookmark),
            onTap: () {
              // Handle "Saved" tap
            },
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("Settings"),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingPage(
                          // Pass your parameters here
                          updatedName: 'Zalfa',
                          updatedEmail: 'zalfa123@gmail.com',
                          updatedPhone: 'Belum disetting',
                          updatedAddress: 'Belum disetting',
                          updatedMembership: 'Belum disetting',
                          updatedLanguage: 'English',
                        )),
              );
            },
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.exit_to_app),
            onTap: () async {
              try {
                // Sign out the user
                await FirebaseAuth.instance.signOut();

                // Navigate back to the login page
                Navigator.pushReplacementNamed(context, "/login");

                // Optionally, show a toast or any other feedback
                Fluttertoast.showToast(
                  msg: "Successfully signed out",
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                );
              } catch (e) {
                // Handle sign-out errors
                print("Error signing out: $e");
                Fluttertoast.showToast(
                  msg: "Error signing out",
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.green[100],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null) {
      setState(() {
        selectedImage = File(returnImage.path);
        _image = File(returnImage.path).readAsBytesSync();
      });
    }
    Navigator.of(context).pop(); // close the modal sheet
  }

  Future<void> _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage != null) {
      setState(() {
        selectedImage = File(returnImage.path);
        _image = File(returnImage.path).readAsBytesSync();
      });
    }
    Navigator.of(context).pop();
  }
}
