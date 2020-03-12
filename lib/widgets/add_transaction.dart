import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Add_transaction extends StatefulWidget {
  //const ({Key key}) : super(key: key);
  final Function addItem;
  Add_transaction(this.addItem);

  @override
  _Add_transactionState createState() => _Add_transactionState();
}

class _Add_transactionState extends State<Add_transaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addItem(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((datepicked) {
      if (datepicked == null) {
        return;
      } else {
        setState(() {
          _selectedDate = datepicked;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              cursorColor: Theme.of(context).primaryColorLight,
              autofocus: true,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: "Title",
                focusColor: Theme.of(context).primaryColorLight,
              ),
              onChanged: (val) => print(titleController.text),
            ),
            TextField(
              controller: amountController,
              cursorColor: Theme.of(context).primaryColorLight,
              keyboardType: TextInputType.number,
              autofocus: true,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: "Amount",
                hoverColor: Theme.of(context).primaryColorLight,
                //labelStyle: TextStyle(color:Colors.greenAccent)
              ),
              onChanged: (val) => print(amountController),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Choosen'
                          : "Picked date: ${DateFormat.yMd().format(_selectedDate)}",
                    ),
                  ),
                  FlatButton(
                      onPressed: () => _presentDatePicker(),
                      textColor: Theme.of(context).primaryColor,
                      child: Text('Choose Date'))
                ])),
            RaisedButton(
              onPressed: () {
                //print(titleInput);
                //print(amountInput);
                submitData;
              },
              padding: EdgeInsets.all(25),
              child: Text(
                "Add Transaction",
                style: TextStyle(fontSize: 20),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
