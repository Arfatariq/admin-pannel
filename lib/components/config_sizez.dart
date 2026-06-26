import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  // Call this in the build method to initialize screen sizes
  void init(BuildContext context) {
    // Get media query data of the device
    _mediaQueryData = MediaQuery.of(context);

    // Get full width and height of the screen
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    // Divide screen into 100 blocks horizontally and vertically
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
