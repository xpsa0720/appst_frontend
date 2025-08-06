import 'package:appst/component/text_component.dart';
import 'package:flutter/material.dart';

class TabComponent extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selet;
  final VoidCallback? tap;

  const TabComponent({
    super.key,
    required this.icon,
    required this.text,
    this.selet = false,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: tap,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9999)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: selet ? Colors.blue[400] : Colors.black87,
                ),
                SizedBox(height: 5),
                TextComponent(
                  text: text,
                  fontSize: 15,
                  fontWeight: selet ? FontWeight.w700 : FontWeight.w500,
                  color: selet ? Colors.blue[400] : Colors.black87,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
