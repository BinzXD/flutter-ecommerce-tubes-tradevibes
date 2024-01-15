import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tubes_mobile/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        side: BorderSide(width: 0.2, color: Colors.grey.shade200),
      ),
      elevation: 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            alignment: Alignment.topRight,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
              width: 30,
              height: 30,
              child: IconButton.filledTonal(
                padding: EdgeInsets.zero,
                onPressed: () {},
                iconSize: 18,
                icon: const Icon(IconlyLight.bookmark),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.nama,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "⭐",
                              style: Theme.of(context).textTheme.bodyMedium),
                          TextSpan(
                              text: "${product.rating}  ",
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: "",
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton.filled(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        iconSize: 18,
                        icon: const Icon(Icons.add),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
