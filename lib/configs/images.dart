import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const jenosizeic = _Image('jenosize_icon.png');
  static const jenosizeLg = _Image('jenosize_logo.png');
  static const dotted = _Image('dotted.png');
  static const digitloader = _Image('digital-loader.gif');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(jenosizeic, context);
    await precacheImage(jenosizeLg, context);
    await precacheImage(dotted, context);
    await precacheImage(digitloader, context);
  }
}
