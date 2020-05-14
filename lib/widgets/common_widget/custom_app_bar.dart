import 'package:flutter/material.dart';
import 'package:mariners_coloring_notes/pages/how_to_play_page.dart';
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
      centerTitle: true,
      title: Text(
        AppLocalizations.of(context).translate('app_title'),
      ),
//      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.help_outline),
//          onPressed: () {
//            Navigator.of(context).push(
//              MaterialPageRoute(
//                builder: (context) {
//                  return HowToPlayPage();
//                },
//              ),
//            );
//          },
//        ),
//      ],
      backgroundColor: AppColors.secondaryElement,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
