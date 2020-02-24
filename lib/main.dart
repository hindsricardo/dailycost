import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daily Budget"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                child: Text("Card"),
              ),
              elevation: 5,
            ),
            Card(
              elevation: 10,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      cursorColor: Colors.greenAccent,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Title",
                        focusColor: Colors.greenAccent,
                      ),
                      onChanged: (val) => titleInput = val,
                    ),
                    TextField(
                      cursorColor: Colors.greenAccent,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Amount",
                        hoverColor: Colors.greenAccent,
                        //labelStyle: TextStyle(color:Colors.greenAccent)
                      ),
                      onChanged: (val) => amountInput = val,
                    ),
                    FlatButton(
                      onPressed: ()  {
                        print(titleInput);
                        print(amountInput);
                      },
                      padding: EdgeInsets.all(25),
                      child: Text(
                        "Add Transaction",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: transactions.map((item) {
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
            ),
          ],
        ));
  }
}
