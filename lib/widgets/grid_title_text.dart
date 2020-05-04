import 'package:flutter/material.dart';
import 'package:mariners_coloring_notes/services/app_localizations.dart';

class GridTitleText extends StatelessWidget {
  const GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.center,
      child: Text(
        AppLocalizations.of(context).translate(text),
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    );
  }
}
