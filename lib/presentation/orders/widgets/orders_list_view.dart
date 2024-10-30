import 'package:flutter/material.dart';

import 'order_card.dart';

class OrdersListView extends StatelessWidget {
  final String status;

  const OrdersListView({required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 5, // For demonstration, replace with your order count
      itemBuilder: (context, index) {
        return OrderCard(
          orderId: "wfd-1002546",
          date: "Sept 25, 2024",
          time: "10:00 pm",
          status: status,
          imageUrl: 'assets/images/order_logo.png', // Replace with actual image URLs
        );
      },
    );
  }


}
