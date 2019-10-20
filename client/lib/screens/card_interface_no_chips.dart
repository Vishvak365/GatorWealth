import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'globals.dart' as globals;

class CardInterfaceW extends StatefulWidget {
  CardInterfaceW({Key key, this.totalSpent}) : super(key: key);
  final double totalSpent;
  _CardInterfaceW createState() => _CardInterfaceW();
}

class _CardInterfaceW extends State<CardInterfaceW> {
  double side = 20;
  double bottom = 450;
  double top = 30;
  String _name = globals
      .name; //double _amountSpent = widget.totalSpent; // The amount of money spent in the time period
  //int index;
  Widget build(BuildContext context) {
    double _amountSpent =
        widget.totalSpent; // The amount of money spent in the time period

    return Scaffold(
      body: Container(
        //padding: EdgeInsets.fromLTRB(side, top, side, bottom),
        height: 1000,
        child: GradientCard(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          gradient: Gradients.rainbowBlue,
          shadowColor: Gradients.rainbowBlue.colors.last.withOpacity(0.25),
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
                      "You have saved",
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
                      '\$' + _amountSpent.toStringAsFixed(2),
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
            ],
          ),
        ),
      ),
    );
  }
}
