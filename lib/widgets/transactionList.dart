import 'package:flutter/material.dart';
import 'package:intl/number_symbols_data.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    "No Transactions Added Yet",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 350,
                    child: Image.asset(
                      'lib/assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "\$ ${transactions[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      "${DateFormat.yMMMd().format(transactions[index].date)}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: () =>
                          deleteTransaction(transactions[index].id),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
