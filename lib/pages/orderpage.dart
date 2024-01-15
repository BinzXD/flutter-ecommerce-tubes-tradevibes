import 'package:flutter/material.dart';
import 'package:tubes_mobile/pages/homepage.dart';
import 'package:tubes_mobile/utils/enums/order.dart';
import 'package:tubes_mobile/data/orders.dart';
import 'package:tubes_mobile/widgets/order_item.dart';
import 'package:tubes_mobile/pages/cartpage.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = OrderStatus.values.map((e) => e.name).toList();
    return DefaultTabController(
      length: tabs.length,
      child: WillPopScope(
        onWillPop: () async {
          // Tombol back ditekan, kembali ke halaman CartPage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          return true; // Kembalikan true agar sistem menangani tombol back
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("My Orders"),
            bottom: TabBar(
              isScrollable: true,
              tabs: List.generate(tabs.length, (index) {
                return Tab(
                  text: tabs[index],
                );
              }),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Ikon keranjang belanja ditekan, kembali ke halaman CartPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
              ),
            ],
          ),
          body: TabBarView(
            children: List.generate(tabs.length, (index) {
              final filteredOrders = orders
                  .where((order) => order.status == OrderStatus.values[index])
                  .toList();
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final order = filteredOrders[index];
                  return OrderItem(order: order);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: filteredOrders.length,
              );
            }),
          ),
        ),
      ),
    );
  }
}
