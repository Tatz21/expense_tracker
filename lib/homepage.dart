import 'package:flutter/material.dart';
import './custom/header.dart';
import './custom/transactioncard.dart';
import './custom/newtransaction.dart';
import './Pages/MyAccount.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = .55;
  double _opacity = .9;

  void _addTransaction() {
    setState(() {
      _height = .08;
      _opacity = 1;
    });
  }

  void _done() {
    setState(() {
      _height = .08;
      _opacity = .9;
    });
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.short_text),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        centerTitle: true,
        title: Text(
          'Expense',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MyAccount()));
            },
          ),
        ],
      ),
      body: Stack(children: [
        Column(
          children: [Header(_addTransaction), NewTransaction(_opacity, _done)],
        ),
        TransactionCard(_height)
      ]),
    );
  }
}
