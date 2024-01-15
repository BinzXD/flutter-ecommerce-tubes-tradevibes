import 'package:tubes_mobile/models/order.dart';
import 'package:tubes_mobile/data/products.dart';
import 'package:tubes_mobile/utils/enums/order.dart';

List<Order> orders = [
  Order(
    id: "AbC123",
    products: products.reversed.take(3).toList(),
    orderingData: DateTime.utc(2023, 1, 1),
    deliveryDate: DateTime.utc(2023, 2, 1),
    status: OrderStatus.Delivered,
  ),
  Order(
    id: "DeF3456",
    products: products.take(1).toList(),
    orderingData: DateTime.utc(2023, 1, 1),
    deliveryDate: DateTime.utc(2023, 2, 1),
    status: OrderStatus.Processing,
  ),
  Order(
    id: "HiJ789",
    products: products.reversed.skip(3).toList(),
    orderingData: DateTime.utc(2023, 2, 5),
    deliveryDate: DateTime.utc(2023, 3, 1),
    status: OrderStatus.Processing,
  ),
  Order(
    id: "KlM012",
    products: products.reversed.skip(3).toList(),
    orderingData: DateTime.utc(2023, 1, 1),
    deliveryDate: DateTime.utc(2023, 2, 5),
    status: OrderStatus.Processing,
  ),
  Order(
    id: "oPQ345",
    products: products.skip(3).take(2).toList(),
    orderingData: DateTime.utc(2023, 1, 1),
    deliveryDate: DateTime.utc(2023, 2, 1),
    status: OrderStatus.Picking,
  ),
  Order(
    id: "AbC123",
    products: products.skip(3).take(2).toList(),
    orderingData: DateTime.utc(2023, 3, 1),
    deliveryDate: DateTime.utc(2023, 4, 1),
    status: OrderStatus.Delivered,
  ),
];
