import 'package:flutter/material.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:seo/seo.dart';

import '../design/text/base_text_style.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final double? fontSize;

  final FontWeight? fontWeight;
  final Color? color;
  final bool Selet;
  final String? fontFamily;
  const TextComponent({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.Selet = false,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Seo.text(
      text: text,
      child:
          Selet
              ? SelectableText(
                text,
                style: BaseFontStyle.copyWith(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  fontFamily: fontFamily,
                ),
              )
              : Text(
                text,
                style: BaseFontStyle.copyWith(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
    );
  }
}
