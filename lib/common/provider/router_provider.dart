import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../user/view/dumy_screen.dart';
import '../../user/view/home/home_screen.dart';
import '../../user/view/login_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: HomeScreen.routeFullPath, // '/'
        builder: (context, state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: LoginScreen.routeFullPath,
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: DumyScreen.routeFullPath,
        builder: (context, state) {
          return DumyScreen();
        },
      ),
    ],
  );
});
