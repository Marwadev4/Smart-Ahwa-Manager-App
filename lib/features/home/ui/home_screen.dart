import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager_app/core/helpers/constants.dart';
import 'package:smart_ahwa_manager_app/core/theming/colors.dart';
import 'package:smart_ahwa_manager_app/core/theming/styles.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_cubit.dart';
import 'package:smart_ahwa_manager_app/features/home/ui/widgets/add_drink_bloc_listener.dart';
import 'package:smart_ahwa_manager_app/features/home/ui/widgets/add_order_button.dart';
import 'package:smart_ahwa_manager_app/features/home/ui/widgets/orders_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: AddOrderButton(),
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: Text('مدير القهوة الذكي', style: TextStyles.fontBlack),
        centerTitle: true,
        backgroundColor: ColorsManager.normal,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<HomeCubit>().getOrders();
          },
          color: ColorsManager.normal,
          child: Column(
            children: [
              Expanded(child: OrdersBlocBuilder()),
              AddDrinkBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
