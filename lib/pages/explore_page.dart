import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tubes_mobile/data/products.dart';
import 'package:tubes_mobile/widgets/productcard.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          //Filter & Search
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: "Mau makan apa hari ini?",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      prefixIcon: const Icon(IconlyLight.search)),
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconButton.filled(
                      onPressed: () {}, icon: const Icon(IconlyLight.filter)),
                )
              ],
            ),
          ),
          //Promo Terbaru
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 170,
              child: Card(
                color: Colors.green.shade50,
                elevation: 0.1,
                shadowColor: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      //textnya disini
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PROMO!!!",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text("Diskon taun baru hanya untuk anda!"),
                            FilledButton(
                              onPressed: () {},
                              child: Text("Pesan"),
                            )
                          ],
                        ),
                      ),
                      //gambarnya disini
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Image.asset(
                          'assets/promo_nampol.png',
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pasti Ada Promo Buatmu!",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(onPressed: () {}, child: const Text("See all"))
            ],
          ),
          //promo buat kamu
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                );
              })
        ],
      ),
    );
  }
}
