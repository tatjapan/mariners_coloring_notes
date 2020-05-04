import 'package:flutter/material.dart';
import 'package:mariners_coloring_notes/model/coloring_image.dart';
import 'package:mariners_coloring_notes/pages/new_canvas_page.dart';
import 'package:mariners_coloring_notes/values/colors.dart';
import 'package:mariners_coloring_notes/widgets/grid_title_text.dart';

class GridImageItem extends StatefulWidget {
  GridImageItem({
    Key key,
    @required this.coloringImage,
  }) : super(key: key);

  final ColoringImage coloringImage;

  @override
  _GridImageItemState createState() => _GridImageItemState();
}

class _GridImageItemState extends State<GridImageItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: GridTile(
            footer: Material(
              color: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: GridTileBar(
                backgroundColor: AppColors.primaryElement,
                title: GridTitleText(widget.coloringImage.imageName),
              ),
            ),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                widget.coloringImage.imageAssetPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: new InkWell(
              splashColor: AppColors.secondaryElement,
              onTap: () {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return NewCanvasPage(coloringImage: widget.coloringImage);
                    }),
                  );
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
