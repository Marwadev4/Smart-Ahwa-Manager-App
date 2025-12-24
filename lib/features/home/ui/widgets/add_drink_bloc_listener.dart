import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager_app/core/helpers/extensions.dart';
import 'package:smart_ahwa_manager_app/core/theming/styles.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_cubit.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_state.dart';

class AddDrinkBlocListener extends StatelessWidget {
  const AddDrinkBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is AddOrderLoading ||
          current is AddOrderError ||
          current is AddOrderSuccess,
      listener: (context, state) {
        if (state is AddOrderLoading) {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.all(20.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Image.asset('assets/animations/loading.gif'),
            ),
          );
        } else if (state is AddOrderSuccess) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) => const Dialog(
              backgroundColor: Colors.transparent,
              child: SuccessAnimation(),
            ),
          );
        } else if (state is AddOrderError) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.white,
              alignment: Alignment.center,
              insetPadding: EdgeInsets.all(20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error, size: 40.sp, color: Colors.red),
                  Text(state.errorMessage, style: TextStyles.font22Black),
                ],
              ),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

class SuccessAnimation extends StatefulWidget {
  const SuccessAnimation({super.key});

  @override
  State<SuccessAnimation> createState() => _SuccessAnimationState();
}

class _SuccessAnimationState extends State<SuccessAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller.forward().whenComplete(() {
      context.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/animations/loading.gif',
      width: 200.h,
      height: 200.h,
    );

    // Lottie.asset(
    //   'assets/animations/Success.json',
    //   controller: _controller,
    //   repeat: false,
    // ),
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
