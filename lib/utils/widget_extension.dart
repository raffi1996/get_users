import 'package:flutter/widgets.dart';

extension WidgetExtension on Widget{


  Widget expandedHorizontally() {
    return Row(
      children: [
        Expanded(child: this),
      ],
    );
  }
}