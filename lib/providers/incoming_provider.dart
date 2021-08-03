import 'package:flutter/material.dart';
import 'package:money_flow/models/incoming_model.dart';

class IncomingProvider extends ChangeNotifier {
  Map<UniqueKey, Incoming> _incomingList = Map<UniqueKey, Incoming>();

  String getPerson(int id) => _incomingList[id].person;
  String getType(int id) => _incomingList[id].type;
  int getValue(int id) => _incomingList[id].value;

  UniqueKey getId(id) => _incomingList[id].id;

  Map<UniqueKey, Incoming> get incomingList => _incomingList;

  void changePerson(int id, String value) {
    _incomingList[id].person = value;
    notifyListeners();
  }

  void changeType(int id, String value) {
    _incomingList[id].type = value;
    notifyListeners();
  }

  void changeValue(int id, int value) {
    _incomingList[id].value = value;
    notifyListeners();
  }

  void addUser(String person, String type, String value) {
    UniqueKey key = UniqueKey();
    _incomingList.putIfAbsent(key, () => Incoming());

    _incomingList[key].person = person;
    _incomingList[key].type = type;
    _incomingList[key].value = int.parse(value);

    print(_incomingList.length);
    print(_incomingList[key].person);
    print(_incomingList[key].type);

    notifyListeners();
  }
}
