import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager_app/core/helpers/constants.dart';
import 'package:smart_ahwa_manager_app/core/helpers/extensions.dart';
import 'package:smart_ahwa_manager_app/core/helpers/spacing.dart';
import 'package:smart_ahwa_manager_app/core/theming/colors.dart';
import 'package:smart_ahwa_manager_app/core/widgets/app_text_form_field.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_cubit.dart';
import 'package:smart_ahwa_manager_app/features/home/logic/home_state.dart';
import 'package:smart_ahwa_manager_app/features/home/ui/widgets/drink_drop_down_field.dart';

class AddOrderButton extends StatelessWidget {
  const AddOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();

    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        if (cubit.isBottomSheetShown) {
          context.pop();
          if (cubit.formKey.currentState!.validate()) {
            cubit.addOrder();
          }
        } else {
          scaffoldKey.currentState!
              .showBottomSheet(
                (context) => Container(
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextFormField(
                          controller: cubit.customerNameController,
                          keyboardType: TextInputType.text,
                          labelText: 'اسم العميل',
                          prefixIcon: Icons.title,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'يجب ألا يكون اسم العميل فارغًا';
                            }
                            return null;
                          },
                        ),
                        verticalSpace(20.h),
                        AppTextFormField(
                          controller: cubit.notesController,
                          keyboardType: TextInputType.text,
                          labelText: 'ملاحظات',
                          prefixIcon: Icons.title,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'يجب ألا تكون الملاحظات فارغة';
                            }
                            return null;
                          },
                        ),
                        DrinkDropdownField(
                          labelText: 'المشروب',
                          selectedDrink: (drink) {
                            cubit.drink = drink;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .closed
              .then((value) {
                cubit.changeBottomSheetState();
              });
          cubit.changeBottomSheetState();
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is AppChangeBottomSheetState,
        builder: (context, state) {
          return Icon(cubit.fabIcon, color: ColorsManager.normal, size: 30.w);
        },
      ),
    );
  }
}
