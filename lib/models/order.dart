import 'package:tubes_mobile/models/product.dart';
import 'package:tubes_mobile/utils/enums/order.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime orderingData;
  final DateTime deliveryDate;
  final OrderStatus status;

  Order(
      {required this.id,
      required this.products,
      required this.orderingData,
      required this.deliveryDate,
      required this.status});
}
