import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_cubit.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_state.dart';
import 'package:smart_ahwa_manager_app/features/home/ui/widgets/orders_list_view.dart';
import 'package:smart_ahwa_manager_app/features/home/ui/widgets/orders_loading.dart';

class OrdersBlocBuilder extends StatelessWidget {
  const OrdersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetOrdersLoading ||
          current is GetOrdersSuccess ||
          current is GetOrdersError,
      builder: (context, state) {
        switch (state) {
          case GetOrdersLoading _:
            return OrdersShimmerLoading();
          case GetOrdersSuccess _:
            return OrdersListView(orders: state.orders);
          case GetOrdersError _:
            return Center(
              child: Text(state.errorMessage, textAlign: TextAlign.center),
            );
          default:
            return const Center(child: Text('حصل خطأ غير معروف'));
        }
      },
    );
  }
}
