import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  //name({Key key}) : super(key: key);


  @override
  TransactionListState createState() => TransactionListState();
}

class TransactionListState extends State<TransactionList> {
    
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
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _transactions.map((item) {
        return Card(
          child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.greenAccent)),
              padding: EdgeInsets.all(15),
              child: Text(
                "\$ ${item.amount}",
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "${DateFormat.yMMMd().format(item.date)}",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ]),
        );
      }).toList(),
    );
  }
}
