import 'package:flutter/cupertino.dart';

BoxDecoration getBaseGradientBackground() {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0, 1.0],
        colors: [
          Color(0xFF3023AE).withOpacity(0.72),
          Color(0xFF85B6F1).withOpacity(0.72),
          Color(0xFFB4EC51).withOpacity(0.72),
        ]
    ),
  );
}

BoxDecoration getDisabledGradientBackground() {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        colors: [
          Color(0xFF403F42).withOpacity(0.72),
          Color(0xFFB3B4B4).withOpacity(0.72),
        ]
    ),
  );
}

TextStyle getButtonBaseTextStyle() {
  return TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 28.0,
    fontWeight: FontWeight.bold
  );
}

TextStyle getDisabledButtonTextStyle() {
  return TextStyle(
      color: Color(0xFFCBC7C7),
      fontSize: 28.0,
      fontWeight: FontWeight.bold
  );
}

TextStyle getContentTextStyle() {
  return TextStyle(
      color: Color(0xFF000000),
      fontSize: 18.0,
  );
}


TextStyle getContentTextStyleBold() {
  return TextStyle(
    color: Color(0xFF000000),
    fontSize: 18.0,
    fontWeight: FontWeight.bold
  );
}

BoxDecoration getInputBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: 2.0, color: Color(0xFF3023AE).withOpacity(0.2)),
  );
}

TextStyle getContentErrorTextStyleBold() {
  return TextStyle(
      color: Color(0xFFFF0000),
      fontSize: 18.0,
      fontWeight: FontWeight.bold
  );
}

BoxDecoration getErrorInputBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: 2.0, color: Color(0xFFFF0000)),
  );
}

EdgeInsets getInputBoxPadding() => EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0);

TextStyle getDefaultPickerTextStyle() {
  return TextStyle(
      color: Color(0xFF000000),
      fontSize: 20.0,
  );
}



