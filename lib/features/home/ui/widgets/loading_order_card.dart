import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_ahwa_manager_app/core/helpers/spacing.dart';
import 'package:smart_ahwa_manager_app/core/theming/colors.dart';
import 'package:smart_ahwa_manager_app/core/theming/styles.dart';
import 'package:smart_ahwa_manager_app/core/widgets/app_text_button.dart';

class LoadingQuoteCard extends StatelessWidget {
  const LoadingQuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.black,
      highlightColor: ColorsManager.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Loading', style: TextStyles.font26VeryDarkGray),
          verticalSpace(10),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Loading',
              style: TextStyles.font22VeryDarkGrayWithOpacity,
            ),
          ),
          verticalSpace(20),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: AppButton(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(6.r),
                    top: Radius.circular(0),
                  ),
                  backgroundColor: ColorsManager.black,
                  borderColor: Colors.white,
                  onPressed: () {},
                  child: Text('Order', style: TextStyles.font22White),
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: AppButton(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(6.r),
                    top: Radius.circular(0),
                  ),
                  backgroundColor: ColorsManager.black,
                  borderColor: ColorsManager.black,
                  onPressed: null,
                  child: Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: ColorsManager.black,
                    size: 30.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
