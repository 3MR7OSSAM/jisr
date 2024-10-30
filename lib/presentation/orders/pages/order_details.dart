import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jisr/core/common/widgets/custom_button.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../widgets/order_card.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OrderDetailsAppBar(),
            const OrderCard(
              isListView: false,
              orderId: "wfd-1002546",
              date: "Sept 25, 2024",
              time: "10:00 pm",
              status: 'Pending',
              imageUrl:
                  'assets/images/order_logo.png', // Replace with actual image URLs
            ),
            SizedBox(width: 0.4.sh, child: const Divider()),

            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Items:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 8),
            const ItemDetails(
              itemName: 'Boost Energy Original',
              discount: '\$100',
              discountPercent: '10%',
              delivery: '\$0.00',
              tax: '\$350',
              total: '\$350',
              imagePath:
                  'assets/images/product1.png', // Replace with actual image path
            ),
            // const Divider(),
            const ItemDetails(
              itemName: 'Asya Strawberry',
              discount: '\$100',
              discountPercent: '10%',
              delivery: '\$0.00',
              tax: '\$350',
              total: '\$350',
              imagePath:
                  'assets/images/product2.png', // Replace with actual image path
            ),
            const Spacer(),
            const Row(
              children: [
                Expanded(
                  child: CustomButton(
                    bgColor: AppColors.darkBlue,
                    child: Text(
                      'Accept',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    bgColor: AppColors.redColor,
                    child: Text(
                      'Reject',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDetailsAppBar extends StatelessWidget {
  const OrderDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_rounded)),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Order Details',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class ItemDetails extends StatelessWidget {
  final String itemName;
  final String discount;
  final String discountPercent;
  final String delivery;
  final String tax;
  final String total;
  final String imagePath;

  const ItemDetails({
    super.key,
    required this.itemName,
    required this.discount,
    required this.discountPercent,
    required this.delivery,
    required this.tax,
    required this.total,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemName,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text('Discount: $discount',
                    style: const TextStyle(fontSize: 12)),
                Text('Discount percent: $discountPercent',
                    style: const TextStyle(fontSize: 12)),
                Text('Delivery: $delivery',
                    style: const TextStyle(fontSize: 12)),
                Text('Tax: $tax', style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                Text('Total : $total',
                    style: const TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 0.4.sh, child: const Divider()),
              ],
            ),
          ),
        ),
        Image.asset(
          imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
