class CreditLimitEdit {
  final String id;
  final String clientId;
  final String userId;
  final double oldLimit;
  final double newLimit;
  final String changeDate;



  CreditLimitEdit({
    required this.id,
    required this.clientId,
    required this.userId,
    required this.oldLimit,
    required this.newLimit,
    required this.changeDate,
  }
  );
}


