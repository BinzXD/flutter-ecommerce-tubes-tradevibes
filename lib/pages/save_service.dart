import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ContactService {
  //method untuk mengambil data dari local storage
  getData() async {
    //inisiasi class untuk menggunakan paket penyimpanan local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //mengambil list/array contacts di local storage
    List<String> itemStrings = prefs.getStringList('contacts') ?? [];

    //mapping data
    return itemStrings
        .map((item) => json.decode(item) as Map<String, dynamic>)
        .toList();
  }

  //method untuk menyimpan data ke local storage
  saveData(
    String name,
    String gender,
    String email,
    String phone,
    String address,
    String hobby,
  ) async {
    //inisiasi class untuk menggunakan paket penyimpanan local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //mengambil data dari localstorage dari list contacts
    List<String> dataList = prefs.getStringList('contacts') ?? [];

    //membuat variabel objek dengan data yang diisi melalui form
    Map<String, dynamic> newData = {
      'id': DateTime.now().millisecondsSinceEpoch.toInt(),
      'name': name,
      'gender': gender,
      'email': email,
      'phone': phone,
      'address': address,
      'hobby': hobby,
    };

    dataList.add(jsonEncode(newData)); // Menambahkan data baru ke dalam daftar
    prefs.setStringList(
      'contacts',
      dataList,
    ); // Menyimpan daftar data ke local storage
  }

  //method untuk mengupdate data ke local storage
  updateData(
    String name,
    String gender,
    String email,
    String phone,
    String address,
    String hobby,
    int id,
  ) async {
    //inisialisasi untuk menggunakan paket
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //mengambil data dari localstorage
    List<String> dataList = prefs.getStringList('contacts') ?? [];

    //membuat variabel objek dengan data yang diisi melalui form
    Map<String, dynamic> newData = {
      'name': name,
      'gender': gender,
      'email': email,
      'phone': phone,
      'address': address,
      'hobby': hobby,
    };

    // Cari data dengan primary key yang sesuai
    int dataIndex = -1;
    for (int i = 0; i < dataList.length; i++) {
      Map<String, dynamic> data = jsonDecode(dataList[i]);
      if (data['id'] == id) {
        dataIndex = i;
        break;
      }
    }

    if (dataIndex != -1) {
      dataList[dataIndex] = jsonEncode(newData);
      // Jika data ditemukan, perbarui data tersebut dengan newData
    }

    prefs.setStringList(
      'contacts',
      dataList,
    ); // Menyimpan daftar data ke local storage
  }

  deleteData(int index) async {
    //adalah metode yang digunakan untuk mendapatkan instance (instansiasi) objek SharedPreferences dalam Flutter.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //digunakan untuk mendapatkan nilai dari SharedPreferences dengan kunci 'data'
    List<String> dataList = prefs.getStringList('contacts') ?? [];

    //menghilangkan data dari dataList berdasarkan index
    dataList.removeAt(index);

    //set ulang local storage dengan data yang diperbarui
    prefs.setStringList('contacts', dataList);
  }
}
