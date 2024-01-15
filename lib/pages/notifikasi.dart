import 'package:flutter/material.dart';
import 'data_notif.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          NotificationItem(
            senderName: 'Ms-glow',
            message: 'Jangan lupa claim promo anda...',
            profileImage: 'images/1.jpg',
            dateSent: '19:25',
            unreadMessagesCount: 0, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'YourStyle',
            message: 'Hanya untuk anda kami berikan..',
            profileImage: 'images/2.jpg',
            dateSent: '17:02',
            unreadMessagesCount: 3, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'Mystyle',
            message: 'Hai bro, kami ada produck baru..',
            profileImage: 'images/3.jpg',
            dateSent: '13:42',
            unreadMessagesCount: 0, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'KidsStore',
            message: 'Ubah style anak sesui trend....',
            profileImage: 'images/4.jpg',
            dateSent: '10:24',
            unreadMessagesCount: 1, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'Diamonnds',
            message: 'Penawaran terbatas hanya untuk.',
            profileImage: 'images/5.jpg',
            dateSent: '06:08',
            unreadMessagesCount: 1, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'Sepatuku',
            message: 'Segera beli sepatu impianmu..',
            profileImage: 'images/6.jpg',
            dateSent: 'Kemarin',
            unreadMessagesCount: 2, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'Tshirt',
            message: 'Baju khusus untuk anda',
            profileImage: 'images/7.jpg',
            dateSent: 'Kemarin',
            unreadMessagesCount: 6, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'SepatuImpian',
            message: 'Hanya untuk anda kami berik..',
            profileImage: 'images/8.jpg',
            dateSent: 'Kemarin',
            unreadMessagesCount: 9, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'MyShoes',
            message: 'Coba keberuntungan anda de..',
            profileImage: 'images/9.jpg',
            dateSent: 'Kemarin',
            unreadMessagesCount: 2, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'Tokoku',
            message: 'Selamat anda terpilih seba..',
            profileImage: 'images/10.jpg',
            dateSent: '2024-01-13',
            unreadMessagesCount: 3, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'Aerostreet',
            message: 'Wujudkan fashion impianmu',
            profileImage: 'images/11.jpg',
            dateSent: '2024-01-13',
            unreadMessagesCount: 5, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'Brodo',
            message: 'Kami berikan penawaran..',
            profileImage: 'images/12.jpg',
            dateSent: '2024-01-12',
            unreadMessagesCount: 1, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'BrandKu',
            message: 'Silahkan klaim diskon anda',
            profileImage: 'images/13.jpg',
            dateSent: '2024-01-11',
            unreadMessagesCount: 8, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'Hellty',
            message: 'Penuhi kebutuhan anda..',
            profileImage: 'images/14.jpg',
            dateSent: '2024-01-11',
            unreadMessagesCount: 4, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'FoodFresth',
            message: 'Hidup sehat dengan konsu..',
            profileImage: 'images/15.jpg',
            dateSent: '2024-01-10',
            unreadMessagesCount: 0, // Tambahkan jumlah pesan belum terbaca
          ),
          NotificationItem(
            senderName: 'CarWash',
            message: 'Kami menyediakan alat pe..',
            profileImage: 'images/16.jpg',
            dateSent: '2024-01-10',
            unreadMessagesCount: 5, // Tambahkan jumlah pesan belum terbaca
          ),
        ],
      ),
    );
  }
}
