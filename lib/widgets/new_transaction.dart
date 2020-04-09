import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function onAddTransaction;

  NewTransaction(this.onAddTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amoutController = TextEditingController();
  DateTime _selectedDate;

  void _submitEntry() {
    final newTitle = this.titleController.text;
    if (this.amoutController.text.isEmpty) {
      return;
    }

    final newAmount = double.parse(this.amoutController.text);

    if (newTitle.isEmpty || newAmount <= 0  || _selectedDate == null) {
      return;
    }
    widget.onAddTransaction(newTitle, newAmount, this._selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: this.context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((selectedDate) {
      if (selectedDate == null) {
        return;
      }
      setState(() {
        this._selectedDate = selectedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: "Title"),
              controller: this.titleController,
              onSubmitted: (_) => this._submitEntry(),
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: "Amount"),
              controller: this.amoutController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => this._submitEntry(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: this._selectedDate == null
                          ? Text('No Date Chosen')
                          : Text('Picked Date - ${DateFormat.yMEd().format(this._selectedDate)}')),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Select a Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            RaisedButton(
              onPressed: this._submitEntry,
              child: Text("Add"),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
