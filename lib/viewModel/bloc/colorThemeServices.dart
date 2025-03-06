
import 'package:flutter/cupertino.dart';


class ColorThemeServices extends InheritedWidget {
  const ColorThemeServices({ super.key, required super.child, this.msg="", required this.bColor});

  final String msg;
  final Color bColor;

  static ColorThemeServices of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorThemeServices>()!;
  }

  @override
  bool updateShouldNotify(ColorThemeServices oldWidget) {
    return msg != oldWidget.msg;
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}


