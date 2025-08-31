import 'package:suit_app/models/user.dart';

abstract interface class UserRepository {
  Future<User> login(String name);

  Future<User> create();
}
