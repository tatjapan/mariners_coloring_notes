class ColoringImage {
  ColoringImage({
    this.imageName,
    this.imageAssetPath,
  });

  String imageName;
  String imageAssetPath;
}

final List<ColoringImage> coloringImageList = [
  ColoringImage(
    imageName: "Kyle Seager",
    imageAssetPath: "assets/images/seager.png",
  ),
  ColoringImage(
    imageName: "Mariner Moose",
    imageAssetPath: "assets/images/moose.png",
  ),
  ColoringImage(
    imageName: "Mariners Logo 1",
    imageAssetPath: "assets/images/logo_1.png",
  ),
  ColoringImage(
    imageName: "Mariners Logo 2",
    imageAssetPath: "assets/images/logo_2.png",
  ),
];
