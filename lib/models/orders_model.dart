import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String userId;
  final String userName;
  final double orderTotal;
  final DateTime timestamp;
  final List<OrderItem> items;

  Order({
    required this.userId,
    required this.userName,
    required this.orderTotal,
    
    required this.timestamp,
    required this.items,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      userId: map['userId'],
      userName: map['userName'],
      orderTotal: map['orderTotal'].toDouble(),
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      items: (map['items'] as List)
          .map((item) => OrderItem.fromMap(item))
          .toList(),
    );
  }
}

class OrderItem {
  final String productName;
  final int quantity;
  final double price;

  OrderItem({
    required this.productName,
    required this.quantity,
    required this.price,
  });

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      productName: map['productName'],
      quantity: map['quantity'],
      price: map['price'].toDouble(),
    );
  }
}
