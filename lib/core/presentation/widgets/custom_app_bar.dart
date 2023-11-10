import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/static/colors.dart';

import '../../utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? widgetTitle;
  final bool canBack, isLeadingEnable;
  final bool centerTitle;
  final bool hideShadow;
  final Color? titleColor;
  final Color? buttonBackColor;
  final Color? backgroundColor;
  final List<Widget>? actions;
  const CustomAppBar({
    Key? key,
    this.title,
    this.widgetTitle,
    this.canBack = false,
    this.centerTitle = true,
    this.hideShadow = true,
    this.backgroundColor = whiteColor,
    this.titleColor,
    this.buttonBackColor = Colors.black,
    this.isLeadingEnable = true,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: isLeadingEnable,
        backgroundColor: backgroundColor,
        elevation: hideShadow ? 0.0 : 4.0,
        shadowColor: hideShadow ? Colors.transparent : Colors.black,
        leading: canBack
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: whiteColor,
                ),
              )
            : null,
        title: widgetTitle ??
            Text(
              title ?? "",
              style: appBarStyle(titleColor),
            ),
        actions: actions,
        centerTitle: centerTitle,
      ),
    );
  }

  @override
  Size get preferredSize {
    late double height;
    height = kToolbarHeight;
    return Size.fromHeight(height);
  }
}
