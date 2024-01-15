import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tubes_mobile/models/product.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});

  final Product cartItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: const Icon(
          IconlyLight.delete,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) async {
        final completer = Completer<bool>();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            content: const Text("Remove from cart?"),
            action: SnackBarAction(
                label: "Keep",
                onPressed: () {
                  completer.complete(false);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                }),
          ),
        );
        Timer(const Duration(seconds: 3), () {
          if (!completer.isCompleted) {
            completer.complete(true);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        });
        return await completer.future;
      },
      child: SizedBox(
        height: 125,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(width: 0.2, color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                //gambar produk
                Container(
                  width: 90,
                  height: double.infinity,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(cartItem.image))),
                ),

                //informasi
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.nama,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        cartItem.deskripsi,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp. ${cartItem.price}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ToggleButtons(
                              onPressed: (index) {
                                if (index == 0) {
                                  //user mau mengurangi jumlah
                                } else if (index == 2) {
                                  //user mau menambah jumlah
                                }
                              },
                              borderRadius: BorderRadius.circular(99),
                              isSelected: const [true, false, true],
                              selectedColor:
                                  Theme.of(context).colorScheme.primary,
                              constraints: const BoxConstraints(
                                  minHeight: 30, minWidth: 30),
                              children: const [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                                Text("2"),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
