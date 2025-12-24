import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager_app/core/helpers/enums.dart';
import 'package:smart_ahwa_manager_app/core/theming/styles.dart';

class DrinkDropdownField extends StatefulWidget {
  const DrinkDropdownField({
    super.key,
    required this.labelText,
    required this.selectedDrink,
  });

  final String labelText;
  final void Function(Drink) selectedDrink;

  @override
  State<DrinkDropdownField> createState() => _DrinkDropdownFieldState();
}

class _DrinkDropdownFieldState extends State<DrinkDropdownField> {
  Drink selectedItem = Drink.coffee;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: TextStyles.font22VeryDarkGray),
        SizedBox(height: 5.h),
        DropdownButtonFormField<Drink>(
          validator: (value) {
            if (value == null) {
              return "Select thing";
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.h),
            border: TextFormFieldBorders.focusedBorderForAppField,
            focusedBorder: TextFormFieldBorders.focusedBorderForAppField,
            enabledBorder: TextFormFieldBorders.focusedBorderForAppField,
          ),
          initialValue: selectedItem,
          borderRadius: BorderRadius.circular(8.r),
          items: Drink.values
              .map(
                (item) => DropdownMenuItem<Drink>(
                  value: item,
                  child: Text(item.label, style: TextStyles.font22Black),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value!;
            });
            widget.selectedDrink(selectedItem);
          },
        ),
      ],
    );
  }
}
