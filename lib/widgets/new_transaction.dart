import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quadro/widgets/adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function onAddTransaction;

  const NewTransaction(this.onAddTransaction);

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

    if (newTitle.isEmpty || newAmount <= 0 || _selectedDate == null) {
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
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Platform.isIOS
                  ? CupertinoTextField(
                      placeholder: 'Title',
                      autocorrect: true,
                      controller: this.titleController,
                      onSubmitted: (_) => this._submitEntry(),
                    )
                  : TextField(
                      autocorrect: true,
                      decoration: const InputDecoration(labelText: "Title"),
                      controller: this.titleController,
                      onSubmitted: (_) => this._submitEntry(),
                    ),
              Platform.isIOS
                  ? CupertinoTextField(
                      placeholder: 'Amount',
                      autocorrect: true,
                      controller: this.amoutController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) => this._submitEntry(),
                    )
                  : TextField(
                      autocorrect: true,
                      decoration: const InputDecoration(labelText: "Amount"),
                      controller: this.amoutController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) => this._submitEntry(),
                    ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: this._selectedDate == null
                            ? const Text('No Date Chosen')
                            : Text(
                                'Picked Date - ${DateFormat.yMEd().format(this._selectedDate)}')),
                    AdaptiveFlatButton('Chose a Date', _presentDatePicker),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: this._submitEntry,
                child: const Text("Add"),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
