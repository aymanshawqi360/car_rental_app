import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';

class AppCountryDropdown extends StatelessWidget {
  final Widget? hintText;
  final Widget? trailingIcon;
  final bool? isFocused;
  final Widget? child;
  final Future<List<MenuItemModel<String>>?> Function(int, String?)?
  paginatedRequest;
  final EdgeInsetsGeometry? contentPadding;

  final InputDecoration? decoration;
  const AppCountryDropdown({
    super.key,
    this.hintText,
    this.trailingIcon,
    this.isFocused,
    this.decoration,
    this.child,
    this.paginatedRequest,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return HighQPaginatedDropdown<String>.paginated(
      hintText:
          hintText ??
          Text(AppStrings.country, style: TextStyles.font14LightGrayRegular),
      trailingIcon:
          trailingIcon ?? SvgPicture.asset(AssetsManager.arrowDropDown),
      backgroundDecoration: (Widget widget) {
        return InputDecorator(
          isFocused: isFocused ?? true,
          decoration:
              decoration ??
              InputDecoration(
                contentPadding:
                    contentPadding ??
                    EdgeInsets.symmetric(
                      horizontal: context.screenWidth * .030,
                      vertical: context.screenHeight * 0.011,
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: ColorsManager.lightGray),
                ),
                filled: true,
                fillColor: ColorsManager.white,
              ),
          child: widget,
        );
      },
      paginatedRequest:
          paginatedRequest ??
          (int index, String? f) async {
            List<MenuItemModel<String>> items = [
              MenuItemModel(label: "label", child: Text("data")),
              MenuItemModel(label: "w", child: Text("w")),
              MenuItemModel(label: "a", child: Text("a")),
              MenuItemModel(label: "a", child: Text("a")),
              MenuItemModel(label: "a", child: Text("a")),
              MenuItemModel(label: "a", child: Text("a")),
              MenuItemModel(label: "a", child: Text("a")),
              MenuItemModel(label: "a", child: Text("a")),
              MenuItemModel(label: "a", child: Text("a")),
              MenuItemModel(label: "a", child: Text("a")),
              MenuItemModel(label: "a", child: Text("a")),
            ];
            return items;
          },
    );
  }
}
