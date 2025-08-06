import 'package:flutter/material.dart';

import '../component/logo_component.dart';
import '../component/tab_component.dart';
import '../design/color/color.dart';
import 'model/tab_model.dart';

class DefaultTab extends StatefulWidget {
  final Widget child;
  const DefaultTab({super.key, required this.child});
  @override
  State<DefaultTab> createState() => _DefaultTabState();
}

class _DefaultTabState extends State<DefaultTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Row(
        children: [Tab(), Expanded(child: Screen(child: widget.child))],
      ),
    );
  }
}

class Screen extends StatelessWidget {
  final Widget child;
  const Screen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Head(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: child)],
          ),
        ),
      ],
    );
  }
}

class Head extends StatefulWidget {
  const Head({super.key});

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Row(children: [LogoComponent()])),
      ],
    );
  }
}

class Tab extends StatefulWidget {
  const Tab({super.key});

  @override
  State<Tab> createState() => _TabState();
}

class _TabState extends State<Tab> {
  int seletTab = 0;

  final List<TabModel> tabList = [
    TabModel(text: '내 현황', icon: Icons.list, route: "none"),
    TabModel(text: '앱 테스트', icon: Icons.phone_iphone, route: "none"),
    TabModel(text: '인증 요청', icon: Icons.alarm, route: "none"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Color(0xFFF8F8FF),
        boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(1, 0), blurRadius: 2),
        ],
      ),

      child: Column(
        children:
            tabList.asMap().entries.map((entry) {
              final int index = entry.key;
              final TabModel tab = entry.value;
              return TabComponent(
                icon: tab.icon,
                text: tab.text,
                selet: index == seletTab,
                tap: () {
                  setState(() {
                    seletTab = index;
                  });
                },
              );
            }).toList(),
      ),
    );
  }
}
