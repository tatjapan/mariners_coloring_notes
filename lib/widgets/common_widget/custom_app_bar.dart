import 'package:flutter/material.dart';
import 'package:mariners_coloring_notes/services/app_localizations.dart';
import 'package:mariners_coloring_notes/values/values.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key key,
    this.icon,
    this.onPressed,
    this.height: 50.0,
  }) : super(key: key);

  final double height;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context).translate('app_title'),
      ),
      backgroundColor: AppColors.secondaryElement,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
