import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_mobile/pages/settingpage.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  String selectedLanguage = "English"; // Default language
  String selectedPayment = "Credit Card ****1234";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      phoneController.text = prefs.getString('phone') ?? '';
      addressController.text = prefs.getString('address') ?? '';
      selectedPayment = prefs.getString('membership') ?? 'Credit Card ****1234';
      selectedLanguage = prefs.getString('language') ?? 'English';
    });
  }

  Future<void> saveProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text);
    prefs.setString('email', emailController.text);
    prefs.setString('phone', phoneController.text);
    prefs.setString('address', addressController.text);
    prefs.setString('membership', selectedPayment);
    prefs.setString('language', selectedLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              await saveProfile();
              // Pass updated data to the SettingPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingPage(
                    updatedName: nameController.text,
                    updatedEmail: emailController.text,
                    updatedPhone: phoneController.text,
                    updatedAddress: addressController.text,
                    updatedMembership: selectedPayment,
                    updatedLanguage: selectedLanguage,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Silahkan isi username",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: Icon(
                  Icons.person,
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Harus menggunakan @",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: Icon(
                  Icons.email,
                ),
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: "Phone",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Pastikan benar",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: Icon(
                  Icons.phone,
                ),
              ),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "Alamat",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Silahkan isi dengan benar",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: Icon(
                  Icons.location_city,
                ),
              ),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Payment",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Select Payment",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: Icon(
                  Icons.card_membership,
                ),
              ),
              value: selectedPayment,
              items: ["Credit Card ****1234", "Dana - 08816411219", "Paylater"]
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPayment = newValue!;
                });
              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Language",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Select Language",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: Icon(
                  LanguageTile.language,
                ),
              ),
              value: selectedLanguage,
              items: ["English", "Indonesia", "Korean"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageTile {
  static const IconData language =
      IconData(0xe366, fontFamily: 'MaterialIcons');
}
