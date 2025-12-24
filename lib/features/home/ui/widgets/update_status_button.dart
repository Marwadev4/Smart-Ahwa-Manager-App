import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ahwa_manager_app/core/helpers/enums.dart';
import 'package:smart_ahwa_manager_app/core/theming/colors.dart';
import 'package:smart_ahwa_manager_app/features/home/data/models/order_response.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_cubit.dart';

class UpdateStatusButton extends StatefulWidget {
  final OrderResponse order;

  const UpdateStatusButton({super.key, required this.order});

  @override
  State<UpdateStatusButton> createState() => _UpdateStatusButtonState();
}

class _UpdateStatusButtonState extends State<UpdateStatusButton> {
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    isDone = widget.order.status == Status.done;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.order.status.label),
        InkWell(
          onTap: () {
            setState(() {
              isDone = !isDone;
            });
            context.read<HomeCubit>().updateOrderStatus(widget.order.id);
          },
          child: Icon(
            isDone ? Icons.check_box : Icons.check_box_outline_blank_rounded,
            color: ColorsManager.normal,
          ),
        ),
      ],
    );
  }
}
