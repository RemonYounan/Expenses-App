class UserTransaction {
  String? id;
  String? title;
  double? amount;
  DateTime? date;

  UserTransaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
