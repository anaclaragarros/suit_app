import 'package:suit_app/models/user.dart';
import 'package:suit_app/repository/impl/user_repository_impl.dart';

class LoginController {
  final _userRepository = UserRepositoryImpl();

  Future<User> login(String name) async {
    final user = await _userRepository.login(name);
    return user;
  }
}
