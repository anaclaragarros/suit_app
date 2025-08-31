
class Client {
  final String id;
  final String name;
  final String email;
  final String cpf;
  final double creditLimit;
  final bool isVip;



  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.cpf,
    required this.creditLimit,
    required this.isVip,
  });

  Client copyWith({
    String? id,
    String? name,
    String? email,
    String? cpf,
    bool? isVip,
    double? creditLimit,
  }) {
    return Client(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      cpf : cpf  ?? this.cpf,
      isVip: isVip ?? this.isVip,
      creditLimit: creditLimit ?? this.creditLimit,
    );
  }
}