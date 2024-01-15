import 'package:tubes_mobile/models/order.dart';
import 'package:tubes_mobile/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final orderTimelines = ['Processing', 'Picking', 'Shipping', 'Delivered'];
    int activeStep = 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          EasyStepper(
            activeStep: activeStep,
            lineLength: 70,
            lineSpace: 0,
            defaultLineColor: Colors.grey.shade300,
            finishedLineColor: Color.fromARGB(255, 108, 199, 111),
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: Colors.black87,
            internalPadding: 0,
            showLoadingAnimation: true,
            stepRadius: 8,
            lineThickness: 1.5,
            steps: List.generate(orderTimelines.length, (index) {
              return EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: activeStep > index
                      ? Color.fromARGB(255, 108, 199, 111).withOpacity(0.5)
                      : Colors.grey.shade400,
                  child: CircleAvatar(
                    radius: 2.5,
                    backgroundColor: activeStep > index
                        ? Color.fromARGB(255, 108, 199, 111)
                        : Colors.grey.shade200,
                  ),
                ),
                title: orderTimelines[index],
                topTitle: true,
              );
            }),
            onStepReached: (index) {},
          ),
          const SizedBox(height: 20),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            elevation: 0.1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order: ${order.id}",
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Chip(
                        shape: const StadiumBorder(),
                        side: BorderSide.none,
                        backgroundColor:
                            theme.colorScheme.primaryContainer.withOpacity(0.4),
                        labelPadding: EdgeInsets.zero,
                        avatar: const Icon(Icons.fire_truck),
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        label: Text(
                          orderTimelines[activeStep],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Delivery estimate"),
                      Text(
                        order.deliveryDate.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Zalfa",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(IconlyLight.home, size: 15),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "Jl. Polines Semarang",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(IconlyLight.call, size: 15),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "088 164 112 19",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment method"),
                      Text(
                        "Credit Card **1234",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          OrderItem(order: order, visibleProducts: 1),
        ],
      ),
    );
  }
}
