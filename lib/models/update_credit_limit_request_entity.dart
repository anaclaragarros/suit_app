class UpdateCreditLimitRequestEntity {
  final int userId;
  final int clientId;
  final double creditLimit;

  UpdateCreditLimitRequestEntity({
    required this.userId,
    required this.clientId,
    required this.creditLimit,

  });

  UpdateCreditLimitRequestEntity copyWith({
    int? userId,
    int? clientId,
    double? creditLimit,
  }) {
    return UpdateCreditLimitRequestEntity(
      userId: userId ?? this.userId,
      clientId: clientId ?? this.clientId,
      creditLimit: creditLimit ?? this.creditLimit,
    );
  }
}