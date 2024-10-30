import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jisr/main.dart';

import '../../../core/configs/routing/routes.dart';
import '../../../core/configs/theme/app_colors.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String time;
  final String status;
  final String imageUrl;
  final bool isListView;

  const OrderCard({
    required this.orderId,
    required this.date,
    required this.time,
    required this.status,
    required this.imageUrl,
    super.key, this.isListView = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: isListView ? 4 : 0,
      // margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order ID : $orderId",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text("Date : $date", style: const TextStyle(fontSize: 12)),
                  Text("Time : $time", style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        "Order Status : ",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkBackground),
                      ),
                      Text(
                        status,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // const SizedBox(width: 16),

            Column(
              children: [
                Image.asset(
                  imageUrl,
                  width: 70,
                  // height: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 5.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    GoRouter.of(context).push(Routes.orderDetails);
                  },
                  child: const Text("Order Details",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
