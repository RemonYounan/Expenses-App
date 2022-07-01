class CardInfo {
  static List<String> cardLabels = [
    'Card Type',
    'Cardholder Name',
    'Card Number',
    'PIN',
    'Expiry Date',
    'CVV',
  ];

  String CardData(
    int i,
    String type,
    String name,
    int number,
    int pin,
    String expiryDate,
    int cvv,
  ) {
    if (i == 0) {
      return type;
    } else if (i == 1) {
      return name;
    } else if (i == 2) {
      return number.toString();
    } else if (i == 3) {
      return '****';
    } else if (i == 4) {
      return expiryDate;
    } else if (i == 5) {
      return "***";
    }
    return '';
  }
}
