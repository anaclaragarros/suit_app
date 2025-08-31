import 'package:dio/dio.dart';
import 'package:suit_app/models/user.dart';
import 'package:suit_app/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final _dio = Dio();

  @override
  Future<User> create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<User> login(String name) async {
    final response = await _dio.post("http://192.168.0.101:8080/user/login", data: {"name": name});
    final user = User.fromMap(response.data);
    return user;
  }
}
