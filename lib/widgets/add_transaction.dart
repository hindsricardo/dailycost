import 'package:flutter/material.dart';

class Add_transaction extends StatelessWidget {
  //const ({Key key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addItem;
  Add_transaction(this.addItem);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <=  0) {
      return;
    }

    addItem(
      enteredTitle,
      enteredAmount,
    );
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
              cursorColor: Colors.greenAccent,
              autofocus: true,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: "Title",
                focusColor: Colors.greenAccent,
              ),
              onChanged: (val) => print(titleController.text),
            ),
            TextField(
              controller: amountController,
              cursorColor: Colors.greenAccent,
              keyboardType: TextInputType.number,
              autofocus: true,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: "Amount",
                hoverColor: Colors.greenAccent,
                //labelStyle: TextStyle(color:Colors.greenAccent)
              ),
              onChanged: (val) => print(amountController),
            ),
            FlatButton(
              onPressed: () {
                //print(titleInput);
                //print(amountInput);
                submitData;
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
    );
  }
}
