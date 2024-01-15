import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tubes_mobile/data/products.dart';
import 'package:tubes_mobile/widgets/cart_item.dart';
import 'package:tubes_mobile/pages/succes.dart'; // Pastikan sudah diimpor

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = products.take(4).toList();
    final totalPrice =
        cartItems.map((e) => e.price).reduce((acc, cur) => acc + cur);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // List Barang
          ...List.generate(cartItems.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CartItem(cartItem: cartItems[index]),
            );
          }),

          // Total barang
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total  (${cartItems.length})"),
              Text("Rp $totalPrice",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 108, 199, 111),
                      )),
            ],
          ),
          const SizedBox(height: 20),

          // Button checkout
          FilledButton.icon(
            onPressed: () {
              _showSuccessScreen(context);
            },
            icon: const Icon(IconlyBold.arrowRight),
            label: const Text("Checkout Now"),
          ),
        ],
      ),
    );
  }

  void _showSuccessScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => SuccessPage()), // Ganti ke SuccessPage
    );
  }
}
