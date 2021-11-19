import 'package:flutter/material.dart';

String colorToString(Color color) {
  if (color == Colors.blue) return 'blue';
  if (color == Colors.green) return 'green';
  if (color == Colors.grey) return 'grey';
  return 'grey';
}

Color stringToColor(String color) {
  if (color == 'blue') return Colors.blue;
  if (color == 'green') return Colors.green;
  if (color == 'grey') return Colors.grey;
  return Colors.grey;
}

class MyState extends ChangeNotifier {
  List _list = [];
  String _filterBy = 'all';

  List get list => _list;

  String get filterBy => _filterBy;

  Future getList() async {
    _list = list;
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
