import 'package:flutter/material.dart';
import '../providers/transactions.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: transaction.color.withOpacity(.8),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Icon(
            transaction.iconData,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
