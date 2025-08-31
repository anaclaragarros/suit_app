
import 'package:suit_app/models/roles.dart';

class User {
  final String name;
  final Roles role;
  final int id;


  User({
    required this.name,
    required this.role,
    required this.id,
  });



  User copyWith({
    String? name,
    Roles? role,
    int? id,

  }) {
    return User(
      name: name ?? this.name,
      id: id ?? this.id,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'role': this.role,
      'id': this.id,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      role: Roles.values.firstWhere((e) =>e.name == map['role'],orElse:() => Roles.DEFAULT ),
      id: map['id'] as int,
    );
  }
}