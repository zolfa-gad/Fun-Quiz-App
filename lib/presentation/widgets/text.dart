import 'package:flutter/material.dart';
import 'package:quize_app/data/constants/consts.dart';

class TextCall extends StatelessWidget {
  const TextCall({
    Key? key,
    required this.text,
    // change size for all later
    this.size = 20,
    this.padding = EdgeInsets.zero,
    this.weight,
    this.color,
    this.fontFamily = notoFonts,
    this.shadows,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String text;
  final double size;
  final EdgeInsets padding;

  final FontWeight? weight;
  final Color? color;
  final String? fontFamily;
  final List<Shadow>? shadows;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
          fontFamily: fontFamily,
          shadows: shadows,
        ),
        overflow: TextOverflow.visible,
        softWrap: true,
        textAlign: textAlign,
        maxLines: 10,
      ),
    );
  }
}
