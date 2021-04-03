
import 'package:expense/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>Transactions(),
      child: MaterialApp(
        title: 'Expense',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
   
          primarySwatch: Colors.blue,
          fontFamily: 'Quicksand',
        ),
        
      ),
    );
  }
}