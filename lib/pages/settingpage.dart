import 'package:flutter/material.dart';
import 'package:tubes_mobile/pages/editprofil.dart';

class SettingPage extends StatelessWidget {
  final String updatedName;
  final String updatedEmail;
  final String updatedPhone;
  final String updatedAddress;
  final String updatedMembership;
  final String updatedLanguage;

  const SettingPage({
    Key? key,
    required this.updatedName,
    required this.updatedEmail,
    required this.updatedPhone,
    required this.updatedAddress,
    required this.updatedMembership,
    required this.updatedLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Use Navigator.pop to go back
          },
        ),
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigasi ke halaman pengeditan profil
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const EditProfil()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
          ),
          ListTile(
            title: Text(updatedName),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text(updatedEmail),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text(updatedPhone),
            leading: Icon(Icons.phone),
          ),
          ListTile(
            title: Text(updatedAddress),
            leading: Icon(Icons.location_city),
          ),
          ListTile(
            title: Text(updatedMembership),
            leading: Icon(Icons.card_membership),
          ),
          ListTile(
            title: Text(updatedLanguage),
            leading: Icon(LanguageTile.language),
          ),
        ],
      ),
    );
  }
}

class LanguageTile {
  static const IconData language =
      IconData(0xe366, fontFamily: 'MaterialIcons');
}
