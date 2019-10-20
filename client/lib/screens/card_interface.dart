import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'globals.dart' as globals;
class CardInterface extends StatefulWidget {
  CardInterface({Key key, this.name}) : super(key: key);
  final String name;
  _CardInterface createState() => _CardInterface();
}

class _CardInterface extends State<CardInterface> {
  double side = 20;
  double bottom = 450;
  double top = 30;
  double _amountSpent = 69.70; // The amount of money spent in the time period
  String _timePeriod =
      "week"; //The time period the total amount spent is listed for
  //int index;
  int _value = 1;
  Widget build(BuildContext context) {
    String _name = globals.name;
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.fromLTRB(side, top, side, bottom),
        height: 1000,
        child: GradientCard(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)),),
          gradient: Gradients.byDesign,
          shadowColor: Gradients.tameer.colors.last.withOpacity(0.25),
          elevation: 8,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Text(
                      'Hello, $_name!',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      "This $_timePeriod, you have spent",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Text(
                      '\$'+_amountSpent.toStringAsFixed(2),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List<Widget>.generate(3, (int index) {
                    if (index == 0) {
                      return ChoiceChip(
                          selectedColor: Colors.grey,
                          label: Text('Today'),
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                              _timePeriod = "day";
                              _amountSpent = 25.32;
                            });
                          });
                    } else if (index == 1) {
                      return ChoiceChip(
                          selectedColor: Colors.grey,
                          label: Text("Week"),
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                              _timePeriod = "week";
                              _amountSpent = 69.70;
                            });
                          });
                    } else {
                      return ChoiceChip(
                          selectedColor: Colors.grey,
                          label: Text('Month'),
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                              _timePeriod = "month";
                              _amountSpent = 213.21;
                            });
                          });
                    }
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
