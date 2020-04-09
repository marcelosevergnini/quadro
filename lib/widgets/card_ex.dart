import 'package:flutter/material.dart';

class CardListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Card(
      //             child: Row(
      //               children: <Widget>[
      //                 Container(
      //                   width: 80,
      //                   margin:
      //                       EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      //                   decoration: BoxDecoration(
      //                       color: Theme.of(context).primaryColorLight,
      //                       border:
      //                           Border.all(color: Colors.black, width: 0.5)),
      //                   padding: EdgeInsets.all(10),
      //                   child: Text(
      //                     '${transactions[index].amount.toStringAsFixed(2)}€',
      //                     textAlign: TextAlign.center,
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 15,
      //                         color: Theme.of(context).primaryColorDark),
      //                   ),
      //                 ),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     Text(
      //                       transactions[index].title,
      //                       style: Theme.of(context).textTheme.title,
      //                     ),
      //                     Text(
      //                       DateFormat('MMMM, EEEE, - dd/MM/yyyy')
      //                           .format(transactions[index].date),
      //                       style: TextStyle(color: Colors.grey),
      //                     )
      //                   ],
      //                 )
      //               ],
      //             ),
      //           );
    );
  }
}