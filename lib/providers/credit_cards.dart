import 'package:flutter/cupertino.dart';
import 'package:personal_expenses/helpers/db_credit_helper.dart';
import 'package:personal_expenses/models/credit_card.dart';

class CreditCards with ChangeNotifier {
  String name = '';
  List<CreditCard> _creditCards = [];

  List<CreditCard> get creditCards {
    return _creditCards;
  }

  Future<void> AddCreditCard(
    String? type,
    String? name,
    int? number,
    int? pin,
    String? expiryDate,
    int? cvv,
  ) async {
    _creditCards.add(
      CreditCard(
        id: DateTime.now().toString(),
        type: type,
        name: name,
        number: number,
        pin: pin,
        expiryDate: expiryDate,
        cvv: cvv,
      ),
    );
    notifyListeners();
    await DBCreditHelper.insert('CreditCards', {
      'type': type!,
      'name': name!,
      'number': number!,
      'pin': pin!,
      'expiryDate': expiryDate!,
      'cvv': cvv!,
    });
  }

  Future<void> getCreditCards() async {
    try {
      final dataList = await DBCreditHelper.getData('CreditCards');
      _creditCards = dataList.map(
        (item) {
          return CreditCard(
            id: item['id'].toString(),
            type: item['type'].toString(),
            name: item['name'].toString(),
            number: int.parse(item['number'].toString()),
            pin: int.parse(item['pin'].toString()),
            expiryDate: item['expiryDate'].toString(),
            cvv: int.parse(item['cvv'].toString()),
          );
        },
      ).toList();
      notifyListeners();
    } catch (err) {
      print('getCreditCards error: $err');
    }
  }

  Future<String> getName() async {
    try {
      final dataList = await DBCreditHelper.getData('CreditCards');
      name = dataList[0]['name'].toString().split(' ').first;
    } catch (err) {
      print('getName: $err');
    }
    return name;
  }
}
