import 'package:client/screens/savings.dart';
import 'package:client/screens/transactions.dart';
import 'package:flutter/material.dart';

class SpendingPage extends StatefulWidget {
  SpendingPage({Key key, this.name}) : super(key: key);
  final String name;
  _SpendingPage createState() => _SpendingPage();
}

class _SpendingPage extends State<SpendingPage> {
  int _selectedIndex = 0; // stores screen that we are on
  Widget _buildPage() {
    String _name = widget.name;
    print(_name);
    if (_selectedIndex == 0) {
      return TransactionsScreen(
      );
    } else {
      return SavingsScreen();
    }
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Spending',
      style: optionStyle,
    ),
    Text(
      'Savings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildPage(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              title: Text('Spending'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              title: Text('Savings'),
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightBlue,
          onTap: _onItemTapped,
        ));
  }
}
