import 'package:appst/common/const/data.dart';
import 'package:appst/common/secure_storage/secure_storage.dart';
import 'package:appst/user/model/user_model.dart';
import 'package:appst/user/repository/auth_repository.dart';
import 'package:appst/user/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final userProvider =
    StateNotifierProvider<userProviderStateNotifier, UserModelBase?>((ref) {
      final authRepo = ref.watch(authRepositoryProvider);
      final storage = ref.watch(secureStorageProvider);
      final userRepo = ref.watch(userRepositoryProvider);
      return userProviderStateNotifier(
        authRepository: authRepo,
        storage: storage,
        userRepository: userRepo,
      );
    });

class userProviderStateNotifier extends StateNotifier<UserModelBase?> {
  final AuthRepository authRepository;
  final FlutterSecureStorage storage;
  final UserRepository userRepository;
  userProviderStateNotifier({
    required this.authRepository,
    required this.storage,
    required this.userRepository,
  }) : super(UserModelLoading()) {
    getMe();
  }

  Future<void> getMe() async {
    try {
      final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
      final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
      if (refreshToken == null || accessToken == null) {
        state = null;
        return;
      }

      final resp = await userRepository.getMe();
      state = resp;
    } catch (e, s) {
      print('에러: ${e} ${s}');
    }
  }

  Future<UserModelBase> login({
    required String email,
    required String password,
  }) async {
    try {
      final resp = await authRepository.login(email: email, password: password);

      await storage.write(key: REFRESH_TOKEN_KEY, value: resp.refreshToken);
      await storage.write(key: ACCESS_TOKEN_KEY, value: resp.accessToken);

      final userResp = await userRepository.getMe();

      state = userResp;

      return userResp;
    } catch (e) {
      print(e);
      state = UserModelError(message: '로그인에 실패했습니다.');
      return Future.value(state);
    }
  }

  logout() async {
    await storage.delete(key: REFRESH_TOKEN_KEY);
    await storage.delete(key: ACCESS_TOKEN_KEY);
    state = null;
  }
}
