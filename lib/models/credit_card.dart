class CreditCard {
  String? id;
  String? type;
  String? name;
  int? number;
  int? pin;
  String? expiryDate;
  int? cvv;

  CreditCard({
    required this.id,
    required this.type,
    required this.name,
    required this.number,
    required this.pin,
    required this.expiryDate,
    required this.cvv,
  });
}
