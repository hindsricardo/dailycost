import 'package:flutter/material.dart';


class Transaction {
  String id;
  String title;
  num amount;
  DateTime date;

  Transaction({
    final this.id,
    @required final this.title,
    @required final this.amount,
    @required final this.date,
  });
}
