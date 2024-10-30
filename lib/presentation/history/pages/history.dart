import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';

import '../../orders/widgets/orders_list_view.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 20.h,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
          child: Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 0.3),
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10)
            ),
            child: const Center(child: Text('Orders List',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14),)),
          ),
        ),
        Expanded(child: const OrdersListView(status: 'Completed',))
      ],
    );
  }
}
