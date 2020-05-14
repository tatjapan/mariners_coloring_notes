import 'package:flutter/material.dart';
import 'package:mariners_coloring_notes/values/values.dart';

class BottomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 80.0,
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.0,
            left: 10.0,
            right: 10.0,
          ),
          child: Text(
            "© 2020 @tatjapan\n The team's trademark and logo, Mariner Moose, are registered trademarks of Major League Baseball Properties, Inc. or Seattle Mariners.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      color: AppColors.secondaryElement,
    );
  }
}
