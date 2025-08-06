import 'package:appst/common/const/data.dart';
import 'package:appst/common/dio/dio.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../model/user_model.dart';
part 'user_repository.g.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return UserRepository(dio, baseUrl: 'http://$SERVER_IP/auth');
});

@RestApi()
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @POST('/')
  @Headers({'accessToken': 'true'})
  Future<UserModel> getMe();
}
