import 'package:appst/common/const/data.dart';
import 'package:appst/common/util/data_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/login_response.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = Dio();
  return AuthRepository(dio: dio, baseUrl: 'http://$SERVER_IP/auth');
});

class AuthRepository {
  final String baseUrl;
  final Dio dio;

  AuthRepository({required this.baseUrl, required this.dio});

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final serialized = DataUtils.plainToBase64('$email:$password');
    final resp = await dio.post(
      '$baseUrl/login',
      options: Options(headers: {'authorization': 'Basic $serialized'}),
    );
    return LoginResponse.fromJson(resp.data);
  }
}
