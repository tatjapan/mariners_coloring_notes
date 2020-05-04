import 'package:flutter/material.dart';
import 'package:mariners_coloring_notes/values/values.dart';

class BottomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 50.0,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Copyrights 2020 All Reserved.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      color: AppColors.secondaryElement,
    );
  }
}
