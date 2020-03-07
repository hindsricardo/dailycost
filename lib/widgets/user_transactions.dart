import 'package:flutter/material.dart';
import './add_transaction.dart';
import './transactionList.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key key}) : super(key: key);

  @override
  UserTransactionsState createState() => UserTransactionsState();
}

class UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 129.95,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Groceries",
      amount: 85.79,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t3",
      title: "Groceries 2",
      amount: 85.79,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t4",
      title: "Groceries 3",
      amount: 85.79,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final item = Transaction(
      title: title.toUpperCase(),
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString()
    );

    setState(() {
      _transactions.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Add_transaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
