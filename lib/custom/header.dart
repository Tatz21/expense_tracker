import 'package:expense/Pages/Reports.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import './expensechart.dart';
import '../model/expense.dart';


class Header extends StatelessWidget {
  final Function addTransaction;

  const Header(this.addTransaction);
  static List<charts.Series<Expense, String>> _series = [
    charts.Series<Expense, String>(
        id: 'Expense',
        domainFn: (Expense expense, _) => expense.category,
        measureFn: (Expense expense, _) => expense.value,
        labelAccessorFn: (Expense expense, _) => '\$${expense.value}',
        colorFn: (Expense expense, _) =>
            charts.ColorUtil.fromDartColor(expense.color),
        data: [
          Expense('Busniss', 148.99, Color(0xff313131)),
          Expense('Meals', 123.99, Color(0xff228B22)),
          Expense('Gifts', 48.99, Color(0xfff6d743)),
          Expense('Gaming', 28.99, Color(0xffd57b51)),
          Expense('Travel', 88.99, Color(0xfffe91ca)),
        ])
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final mediaQuery = MediaQuery.of(context);

    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * .4,
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: ExpenseChart(_series, animate: true),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                  onPressed: addTransaction,
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    width: 124,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.playlist_add,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Add Transaction',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Reports()));
                  },
                  color: Colors.black,
                  child: Container(
                    width: 72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Reports',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Transactions',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
