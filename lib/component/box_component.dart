import 'package:flutter/material.dart';

class BoxComponent extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? inPading;
  final EdgeInsets? outPading;

  const BoxComponent({super.key, this.child, this.inPading, this.outPading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outPading ?? EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF2E3FF),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(offset: Offset(1, 1), color: Colors.black, blurRadius: 2),
          ],
        ),

        child: Padding(padding: inPading ?? EdgeInsets.all(8.0), child: child),
      ),
    );
  }
}
