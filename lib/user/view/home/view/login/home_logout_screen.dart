import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/default_tab.dart';
import '../../../../../component/box_button_component.dart';
import '../../../../../component/logo_component.dart';
import '../../../../../component/text_component.dart';
import '../../../login_screen.dart';

class HomeOutScreen extends ConsumerStatefulWidget {
  const HomeOutScreen({super.key});

  @override
  ConsumerState<HomeOutScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeOutScreen> {
  final double width = 400;
  final double height = 160;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height; // 화면 크기
    return DefaultTab(
      child: Column(
        children: [
          Column(
            children: [
              LogoComponent(width: 500),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTestButton(width: width, hegiht: height),
                  LogintButton(width: width, hegiht: height),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [TutorialButton(width: width, hegiht: height)],
              ),
              SizedBox(height: screenHeight * 0.30),
            ],
          ),
        ],
      ),
    );
  }
}

class TutorialButton extends StatelessWidget {
  final double width;
  final double hegiht;
  const TutorialButton({super.key, required this.width, required this.hegiht});

  @override
  Widget build(BuildContext context) {
    return BoxButtonComponent(
      width: width,
      height: hegiht,
      borderWidth: 5,
      borderColor: Color(0xFFDA70D6),
      inPading: EdgeInsets.all(20),
      child: Column(
        children: [
          TextComponent(
            text: '사용절차',
            fontSize: 50,
            color: Colors.black87,
            fontWeight: FontWeight.w800,
          ),
          TextComponent(
            text: '처음이라면 꼭 확인하세요!',
            fontSize: 25,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}

class AppTestButton extends StatelessWidget {
  final double width;
  final double hegiht;
  const AppTestButton({super.key, required this.width, required this.hegiht});

  @override
  Widget build(BuildContext context) {
    return BoxButtonComponent(
      width: width,
      height: hegiht,
      borderWidth: 5,
      borderColor: Color(0xFFC078FF),
      inPading: EdgeInsets.all(20),
      child: Column(
        children: [
          TextComponent(
            text: '앱 테스트 하기',
            fontSize: 50,
            color: Colors.black87,
            fontWeight: FontWeight.w800,
          ),
          TextComponent(
            text: '꼭 사용절차를 읽어보세요!',
            fontSize: 25,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}

class LogintButton extends StatelessWidget {
  final double width;
  final double hegiht;
  const LogintButton({super.key, required this.width, required this.hegiht});

  @override
  Widget build(BuildContext context) {
    return BoxButtonComponent(
      onPressed: () {
        context.go(LoginScreen.routeFullPath);
      },
      width: width,
      height: hegiht,
      borderWidth: 5,
      borderColor: Color(0xFFC078FF),
      inPading: EdgeInsets.all(20),
      child: Column(
        children: [
          TextComponent(
            text: '로그인',
            fontSize: 50,
            color: Colors.black87,
            fontWeight: FontWeight.w800,
          ),
          TextComponent(
            text: '준비 사항을 꼭 확인하세요!',

            fontSize: 25,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
