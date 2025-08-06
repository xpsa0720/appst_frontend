import 'package:appst/user/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LogoComponent extends StatelessWidget {
  final double? width;
  const LogoComponent({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,

        child: GestureDetector(
          onTap: () {
            context.go(HomeScreen.routeFullPath);
          },
          child: SvgPicture.asset('images/logo/APPST.svg', width: width ?? 100),
        ),
      ),
    );
  }
}
