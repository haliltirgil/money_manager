import 'package:flutter/material.dart';
import 'package:money_flow/models/exiting_model.dart';

class ExitingProvider extends ChangeNotifier {
  Map<UniqueKey, Exiting> _exitingList = Map<UniqueKey, Exiting>();

  String getPerson(int id) => _exitingList[id].person;
  String getType(int id) => _exitingList[id].type;
  int getValue(int id) => _exitingList[id].value;

  UniqueKey getId(id) => _exitingList[id].id;

  Map<UniqueKey, Exiting> get exitingList => _exitingList;

  void changePerson(int id, String value) {
    _exitingList[id].person = value;
    notifyListeners();
  }

  void changeType(int id, String value) {
    _exitingList[id].type = value;
    notifyListeners();
  }

  void changeValue(int id, int value) {
    _exitingList[id].value = value;
    notifyListeners();
  }

  void addElement(String person, String type, String value) {
    UniqueKey key = UniqueKey();
    _exitingList.putIfAbsent(key, () => Exiting());

    _exitingList[key].person = person;
    _exitingList[key].type = type;
    _exitingList[key].value = int.parse(value);

    print(_exitingList.length);
    print(_exitingList[key].person);
    print(_exitingList[key].type);

    notifyListeners();
  }
}
