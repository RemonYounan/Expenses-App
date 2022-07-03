import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePrefs with ChangeNotifier {
  bool? _isFirst = false;
  Future<SharedPreferences> getInst() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> SetBool() async {
    final prefs = await getInst();
    prefs.setBool('first', true);
    notifyListeners();
    print('Set Bool : done');
  }

  Future<bool?> CheckFirst() async {
    final prefs = await getInst();
    final bool? first = await prefs.getBool('first');
    _isFirst = first!;
    return null;
  }

  bool get checkIsFirst {
    print(_isFirst);
    return _isFirst!;
  }

  Future<void> RemoveFirst() async {
    final prefs = await getInst();
    prefs.setBool('first', false);
  }
}
