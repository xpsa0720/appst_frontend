import 'package:appst/user/model/user_model.dart';
import 'package:appst/user/provider/user_provider.dart';
import 'package:appst/user/view/home/view/login/home_login_screen.dart';
import 'package:appst/user/view/home/view/login/home_logout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static String get routeFullPath => '/';
  static String get routePath => '';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    if (user is UserModel) return HomeLoginScreen(user: user as UserModel);
    return HomeOutScreen();
  }
}
