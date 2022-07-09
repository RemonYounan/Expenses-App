class UserTransaction {
  String? id;
  String? category;
  String? title;
  double? amount;
  DateTime? date;

  UserTransaction({
    required this.id,
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  });
}
