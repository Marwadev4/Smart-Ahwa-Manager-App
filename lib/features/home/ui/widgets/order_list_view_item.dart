import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager_app/core/theming/colors.dart';
import 'package:smart_ahwa_manager_app/core/theming/styles.dart';
import 'package:smart_ahwa_manager_app/features/home/data/models/order_response.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_cubit.dart';
import 'package:smart_ahwa_manager_app/features/home/ui/widgets/update_status_button.dart';

class OrderListViewItem extends StatelessWidget {
  final OrderResponse order;

  const OrderListViewItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(order.id.toString()),
      onDismissed: (direction) {
        context.read<HomeCubit>().deleteOrder(order.id);
      },
      background: Container(
        margin: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: ColorsManager.dark,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(Icons.delete, size: 30.sp, color: ColorsManager.light),
      ),
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: _buildLeading(),
          title: Text(
            order.customerName,
            style: TextStyles.font26VeryDarkGray,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            order.drink,
            style: TextStyles.font22VeryDarkGrayWithOpacity,
          ),
          contentPadding: EdgeInsets.all(8.h),
          trailing: UpdateStatusButton(order: order),
        ),
      ),
    );
  }

  Widget _buildLeading() {
    return Hero(
      tag: 'order_${order.id}',
      child: Container(
        width: 60.h,
        height: 60.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
        child: Image.asset(
          'assets/images/${order.image}',
          width: 60.h,
          height: 60.h,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey[200],
            child: const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
