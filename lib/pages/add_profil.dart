import 'package:flutter/material.dart';
import 'package:tubes_mobile/pages/save_service.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});
  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  //inisialisasi variabel
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController hobby = TextEditingController();

  //inisialisasi class
  ContactService contactService = ContactService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Tambah Data'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildFormField(
                label: 'Nama',
                controller: name,
                icon: Icons.person,
              ),
              SizedBox(height: 15),
              _buildDropdownFormField(
                label: 'Jenis Kelamin',
                items: ['Laki-Laki', 'Perempuan'],
                onChanged: (String? newValue) {
                  setState(() {
                    gender.text = newValue!;
                  });
                },
                icon: Icons.people,
              ),
              SizedBox(height: 15),
              _buildFormField(
                label: 'Email',
                controller: email,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email,
              ),
              SizedBox(height: 15),
              _buildFormField(
                label: 'Nomor Handphone',
                controller: phone,
                keyboardType: TextInputType.phone,
                icon: Icons.phone,
              ),
              SizedBox(height: 15),
              _buildFormField(
                label: 'Alamat',
                controller: address,
                icon: Icons.location_on,
              ),
              SizedBox(height: 15),
              _buildFormField(
                label: 'Hobi',
                controller: hobby,
                icon: Icons.favorite,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    contactService.saveData(
                      name.text,
                      gender.text,
                      email.text,
                      phone.text,
                      address.text,
                      hobby.text,
                    );
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/',
                      (Route<dynamic> route) => false,
                    );
                  }
                },
                child: Text('Tambah Data'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    required IconData icon,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        icon: Icon(icon),
      ),
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukkan $label';
        }
        return null;
      },
    );
  }

  Widget _buildDropdownFormField({
    required String label,
    required List<String> items,
    required Function(String?) onChanged,
    required IconData icon,
  }) {
    return DropdownButtonFormField<String>(
      items: items.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        icon: Icon(icon),
      ),
    );
  }
}
