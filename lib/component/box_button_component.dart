import 'package:flutter/material.dart';

class BoxButtonComponent extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? inPading;
  final EdgeInsets? outPading;
  final double? width;
  final double? height;
  final double? borderWidth;
  final double? elevation;
  final Color? borderColor;
  final Color? color;
  final VoidCallback? onPressed;
  const BoxButtonComponent({
    super.key,
    this.child,
    this.inPading,
    this.outPading,
    this.width,
    this.height,
    this.onPressed,
    this.borderWidth,
    this.borderColor,
    this.elevation,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outPading ?? EdgeInsets.all(8.0),
      child: SizedBox(
        width: width ?? 300,
        height: height ?? 300,
        child: ElevatedButton(
          onPressed: onPressed ?? () {},
          child: Padding(
            padding: inPading ?? EdgeInsets.all(8.0),
            child: child,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: BorderSide(
              width: borderWidth ?? 0,
              color: borderColor ?? Colors.black,
            ),
            elevation: elevation ?? 5,
          ),
        ),
      ),
    );
  }
}
