import 'package:flutter/material.dart';
import 'package:mariners_coloring_notes/model/coloring_image.dart';
import 'package:mariners_coloring_notes/widgets/common_widget/bottom_footer.dart';
import 'package:mariners_coloring_notes/widgets/common_widget/custom_app_bar.dart';
import 'package:mariners_coloring_notes/widgets/grid_image_item.dart';

class SelectImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: CustomAppBar(),
      body: _buildContent(context),
      bottomNavigationBar: BottomFooter(),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 15,
    crossAxisSpacing: 15,
    padding: EdgeInsets.all(10),
    childAspectRatio: 1,
    children: coloringImageList
        .map<Widget>(
          (coloringImage) => GridImageItem(
            coloringImage: coloringImage,
          ),
        )
        .toList(),
  );
}
