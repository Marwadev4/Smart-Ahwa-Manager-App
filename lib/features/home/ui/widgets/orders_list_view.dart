import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ahwa_manager_app/core/helpers/spacing.dart';
import 'package:smart_ahwa_manager_app/features/home/data/models/order_response.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_cubit.dart';
import 'package:smart_ahwa_manager_app/features/home/ui/widgets/order_list_view_item.dart';

class OrdersListView extends StatefulWidget {
  final List<OrderResponse?> orders;

  const OrdersListView({super.key, required this.orders});

  @override
  State<OrdersListView> createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {
  var selectedSpecializationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.orders.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSpecializationIndex = index;
            });
            context.read<HomeCubit>().getOrders();
          },
          child: OrderListViewItem(order: widget.orders[index]!),
        );
      },
      separatorBuilder: (context, index) => verticalSpace(16),
    );
  }
}
