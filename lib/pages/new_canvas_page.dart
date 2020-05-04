import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mariners_coloring_notes/model/coloring_image.dart';
import 'package:mariners_coloring_notes/model/touch_points.dart';

import 'package:mariners_coloring_notes/values/values.dart';
import 'package:mariners_coloring_notes/widgets/canvas_painter.dart';
import 'package:mariners_coloring_notes/widgets/common_widget/bottom_footer.dart';

import 'package:path_provider/path_provider.dart';

class NewCanvasPage extends StatefulWidget {
  NewCanvasPage({Key key, @required this.coloringImage}) : super(key: key);

  final ColoringImage coloringImage;

  @override
  _NewCanvasPageState createState() => _NewCanvasPageState();
}

class _NewCanvasPageState extends State<NewCanvasPage> {
  GlobalKey previewContainer = new GlobalKey();

  List<TouchPoints> points = List();
  double opacity = 1.0;
  StrokeCap strokeType = StrokeCap.round;
  double strokeWidth = 5.0;
  Color selectedColor = Colors.cyan;
  Color pickerColor = Colors.cyan;
  Image _image2;

  Future<void> _takeScreenShot() async {
    RenderRepaintBoundary boundary =
        previewContainer.currentContext.findRenderObject();
//    double pixelRatio = originalSize / MediaQuery.of(context).size.width;
    ui.Image image = await boundary.toImage(pixelRatio: 2.0);
    final directory = (await getApplicationDocumentsDirectory()).path;
    print(directory);
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    setState(() {
      _image2 = Image.memory(pngBytes.buffer.asUint8List());
    });
    print(pngBytes.length);
    File imgFile = new File('$directory/screenshot.png');
    try {
      imgFile.writeAsBytes(pngBytes);
      print('Success!');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _pickStroke() async {
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        //Clips its child in a oval shape
        return AlertDialog(
          //Creates three buttons to pick stroke value.
          actions: <Widget>[
            //Resetting to default stroke value
            FlatButton(
              child: Icon(
                Icons.brush,
                size: 16,
              ),
              onPressed: () {
                strokeWidth = 3.0;
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Icon(
                Icons.brush,
                size: 24,
              ),
              onPressed: () {
                strokeWidth = 10.0;
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Icon(
                Icons.brush,
                size: 40,
              ),
              onPressed: () {
                strokeWidth = 30.0;
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Icon(
                Icons.brush,
                size: 60,
              ),
              onPressed: () {
                strokeWidth = 50.0;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _pickColor(Color color) {
    pickerColor = color;
  }

  List<Widget> fabOption() {
    return <Widget>[
      FloatingActionButton(
        heroTag: "save",
        child: Icon(Icons.save),
        tooltip: 'Save',
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _takeScreenShot();
        },
      ),
      FloatingActionButton(
        heroTag: "paint_stroke",
        child: Icon(Icons.brush),
        tooltip: 'Stroke',
        onPressed: () {
          //min: 0, max: 50
          _pickStroke();
        },
      ),
      FloatingActionButton(
        heroTag: "eraser",
        child: FaIcon(FontAwesomeIcons.eraser),
        tooltip: 'Eraser',
        onPressed: () {
          selectedColor = Color.fromARGB(250, 250, 250, 250);
        },
      ),
      FloatingActionButton(
        heroTag: "delete_all",
        child: Icon(Icons.delete_sweep),
        tooltip: "Delete All",
        onPressed: () {
          points.clear();
        },
      ),
      FloatingActionButton(
        backgroundColor: pickerColor,
        heroTag: "color_picker",
        tooltip: 'Color',
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Pick a color!'),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: pickerColor,
                    onColorChanged: _pickColor,
                    showLabel: true,
                    enableAlpha: true,
                    pickerAreaHeightPercent: 0.8,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Got it'),
                    onPressed: () {
                      selectedColor = pickerColor;
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
          setState(() {
            _pickColor(pickerColor);
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: previewContainer,
      child: MaterialApp(
        home: Scaffold(
//        appBar: CustomAppBar(),
          body: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                RenderBox renderBox = context.findRenderObject();
                points.add(TouchPoints(
                    points: renderBox.globalToLocal(details.globalPosition),
                    paint: Paint()
                      ..strokeCap = strokeType
                      ..isAntiAlias = true
                      ..color = selectedColor
                      ..strokeWidth = strokeWidth));
              });
            },
            onPanStart: (details) {
              setState(() {
                RenderBox renderBox = context.findRenderObject();
                points.add(TouchPoints(
                    points: renderBox.globalToLocal(details.globalPosition),
                    paint: Paint()
                      ..strokeCap = strokeType
                      ..isAntiAlias = true
                      ..color = selectedColor
                      ..strokeWidth = strokeWidth));
              });
            },
            onPanEnd: (details) {
              setState(() {
                points.add(null);
              });
            },
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  size: Size.infinite,
                  painter: CanvasPainter(
                    pointsList: points,
                  ),
                ),
                Center(
                  child: Image.asset(widget.coloringImage.imageAssetPath),
                ),
              ],
            ),
          ),
          floatingActionButton: AnimatedFloatingActionButton(
            fabButtons: fabOption(),
            colorStartAnimation: AppColors.secondaryElement,
            colorEndAnimation: Colors.cyan,
            animatedIconData: AnimatedIcons.menu_close,
          ),
          bottomNavigationBar: BottomFooter(),
        ),
      ),
    );
  }
}
