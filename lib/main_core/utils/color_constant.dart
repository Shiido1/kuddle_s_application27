import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color whiteA7007f = fromHex('#7fffffff');

  static Color deepOrange50 = fromHex('#f9efe7');

  static Color gray5001 = fromHex('#fafafa');

  static Color black900B2 = fromHex('#b2000000');

  static Color blueA400 = fromHex('#2f80ed');

  static Color blueA700 = fromHex('#1456f1');

  static Color red300 = fromHex('#c67b47');

  static Color black9003f = fromHex('#3f000000');

  static Color gray50 = fromHex('#f6f8fe');

  static Color black90066 = fromHex('#66000000');

  static Color black900 = fromHex('#000000');

  static Color deepOrange600 = fromHex('#eb5b32');

  static Color blueGray700 = fromHex('#494e6e');

  static Color blueGray900 = fromHex('#333333');

  static Color blueA700B2 = fromHex('#b21456f1');

  static Color pink400 = fromHex('#f05572');

  static Color tealA700 = fromHex('#0ecba1');

  static Color gray600 = fromHex('#7a7c7f');

  static Color gray700 = fromHex('#566066');

  static Color blue900 = fromHex('#003399');

  static Color gray400 = fromHex('#bdbdbd');

  static Color gray60002 = fromHex('#808080');

  static Color gray60001 = fromHex('#7a7585');

  static Color gray500 = fromHex('#9295a4');

  static Color blueGray100 = fromHex('#d1d1d6');

  static Color black900E5 = fromHex('#e5000000');

  static Color blueGray400 = fromHex('#8a8a8e');

  static Color gray800 = fromHex('#3b3744');

  static Color gray900 = fromHex('#1c222a');

  static Color blue50 = fromHex('#e6f4f6');

  static Color gray100 = fromHex('#f2f2f2');

  static Color black900Cc = fromHex('#cc000000');

  static Color bluegray400 = fromHex('#888888');

  static Color indigo900 = fromHex('#252b64');

  static Color blueGray800E5 = fromHex('#e5384054');

  static Color blueGray40001 = fromHex('#8d8a8e');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
