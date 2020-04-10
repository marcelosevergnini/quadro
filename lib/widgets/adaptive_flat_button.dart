import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;

  const AdaptiveFlatButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              this.text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: this.handler)
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: this.handler,
            child: Text(
              this.text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ));
  }
}
