import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'card_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'transaction_entry_model.dart';
class TransactionsScreen extends StatefulWidget {
  TransactionsScreen({Key key, this.name}) : super(key: key);
  final String name;
  _TransactionsScreen createState() => _TransactionsScreen();
}

class _TransactionsScreen extends State<TransactionsScreen> {
  List<Transactions> _notes = List<Transactions>();
  List<Transactions> _notesForDisplay = List<Transactions>();

  Future<List<Transactions>> fetchNotes() async {
    var url =
        'https://raw.githubusercontent.com/Vishvak365/testrep/master/transactions.json';
    var response = await http.get(url);

    var notes = List<Transactions>();

    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        var amountSpent = Transactions.fromJson(noteJson).amountSpent;
        var date = Transactions.fromJson(noteJson).date;
        var name = Transactions.fromJson(noteJson).transactionName;
        if (amountSpent != null && date != null && name != null)
          notes.add(Transactions.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _name = widget.name;
    double side = 20;
    double bottom = 000; //500
    double top = 30;
    return Scaffold(
      
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(side, top, side, bottom),
            child: CardInterface(name: _name,),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .35,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .55,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return index == 0 ? _searchBar() : _listItem(index - 1);
              },
              itemCount: _notesForDisplay.length + 1,
            ),
          )
        ],
      ),
    ));
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var noteTitle = note.transactionName.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width* .6,
                    child: AutoSizeText(
                  _notesForDisplay[index].transactionName,
                  maxLines: 1,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
                Text(
                  _notesForDisplay[index].date,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        child: Text(
                      '\$' + _notesForDisplay[index].amountSpent.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        color: (_notesForDisplay[index].amountSpent > 0)
                            ? Colors.green.shade600
                            : Colors.red.shade600,
                      ),
                    ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
