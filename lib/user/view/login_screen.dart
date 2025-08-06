import 'package:appst/component/box_button_component.dart';
import 'package:appst/component/text_component.dart';
import 'package:appst/user/model/user_model.dart';
import 'package:appst/user/provider/user_provider.dart';
import 'package:appst/user/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/default_tab.dart';
import '../../component/text_form_field_component.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String get routeFullPath => '/login';
  static String get routePath => 'login';

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController email_controller;
  late TextEditingController password_controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email_controller = TextEditingController();
    password_controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final user = ref.watch(userProvider);
    if (user is UserModel) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(HomeScreen.routeFullPath);
      });
    }

    return DefaultTab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextComponent(text: '로그인', fontSize: 40),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextFormFieldComponent(
                    width: 200,
                    hint: "이메일",
                    controller: email_controller,
                  ),
                  TextFormFieldComponent(
                    width: 200,
                    hint: "비밀번호",
                    controller: password_controller,
                    isPassword: true,
                  ),
                ],
              ),
              SizedBox(width: 10),
              BoxButtonComponent(
                onPressed: () async {
                  final resp = await ref
                      .read(userProvider.notifier)
                      .login(
                        email: email_controller.text,
                        password: password_controller.text,
                      );
                },
                width: 110,
                height: 100,

                color: Colors.white,
                elevation: 0,
                child: TextComponent(text: '로그인'),
              ),
            ],
          ),

          SizedBox(height: height * 0.3),
        ],
      ),
    );
  }
}
