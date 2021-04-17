import 'package:flutter/material.dart';

class Transaction {
  String _id;
  String _title;
  double _value;
  String _category;
  IconData _iconData;
  Color _color;

  String get txnId => _id;
  String get txnTitle => _title;
  double get txnAmount => _value;
  IconData get txnIcon => _iconData;
  String get txncategory =>_category;
  get txnColor => _color;
  

  Transaction(
     this._id,
     this._title,
     this._value,
     this._category,
     this._iconData,
     this._color,

  );
}

class Transactions with ChangeNotifier {
  List<Transaction> _transactions = [];
  List<Transaction> get transactions{
    return _transactions;
  }
}


