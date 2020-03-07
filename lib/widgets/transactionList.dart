import 'package:flutter/material.dart';
import 'package:intl/number_symbols_data.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.greenAccent)),
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "\$ ${transactions[index].amount.toStringAsFixed(2)}",
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
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "${DateFormat.yMMMd().format(transactions[index].date)}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ]),
            );
          },
          itemCount: transactions.length,
        ));
  }
}
