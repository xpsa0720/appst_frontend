import 'package:appst/user/model/user_model.dart';
import 'package:appst/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../common/default_tab.dart';
import '../../../../../component/box_button_component.dart';
import '../../../../../component/logo_component.dart';
import '../../../../../component/text_component.dart';

class HomeLoginScreen extends ConsumerStatefulWidget {
  final UserModel user;
  const HomeLoginScreen({super.key, required this.user});

  @override
  ConsumerState<HomeLoginScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeLoginScreen> {
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
                  LogOutButton(width: width, hegiht: height),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TutorialButton(width: width, hegiht: height),
                  AlertButton(width: width, hegiht: height),
                ],
              ),
              SizedBox(height: screenHeight * 0.30),
            ],
          ),
        ],
      ),
    );
  }
}

class AlertButton extends StatelessWidget {
  final double width;
  final double hegiht;
  const AlertButton({super.key, required this.width, required this.hegiht});

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
            text: '알람',
            fontSize: 50,
            color: Colors.black87,
            fontWeight: FontWeight.w800,
          ),
          TextComponent(
            text: '인증 확인을 해주세요!',
            fontSize: 25,
            color: Colors.black87,
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

class LogOutButton extends ConsumerWidget {
  final double width;
  final double hegiht;
  const LogOutButton({super.key, required this.width, required this.hegiht});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BoxButtonComponent(
      onPressed: () {
        ref.read(userProvider.notifier).logout();
      },

      width: width,
      height: hegiht,
      borderWidth: 5,
      borderColor: Color(0xFFC078FF),
      inPading: EdgeInsets.all(20),
      child: Column(
        children: [
          TextComponent(
            text: '로그아웃',
            fontSize: 50,
            color: Colors.black87,
            fontWeight: FontWeight.w800,
          ),
          TextComponent(text: '다음에 만나요!', fontSize: 25, color: Colors.black87),
        ],
      ),
    );
  }
}
