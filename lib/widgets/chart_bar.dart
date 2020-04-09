import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double espendingAmount;
  final double spedingPctOfTotal;

  ChartBar(this.label, this.espendingAmount, this.spedingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 18,
            child: FittedBox(
                child: Text('${espendingAmount.toStringAsFixed(1)}€'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 12,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5)),
              ),
              FractionallySizedBox(
                heightFactor: spedingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
