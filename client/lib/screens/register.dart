import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.black,
          image: DecorationImage(
              image: NetworkImage(
                'https://www.dealfuel.com/wp-content/uploads/2015/06/color191.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop)),
        ),
        padding: EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: Image.network(
                      'https://i0.wp.com/codecollege.co.za/wp-content/uploads/2016/12/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91.767530171531268819878.png?fit=550%2C424&ssl=1'),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Registration',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    textInputAction: TextInputAction.none,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hasFloatingPlaceholder: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        // hintText: 'Enter your product title',
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'First Name'),
                    onChanged: (String value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hasFloatingPlaceholder: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      // hintText: 'Enter your product description',
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Last Name'),
                  onChanged: (String value) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hasFloatingPlaceholder: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      // hintText: 'Enter your product description',
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Email Address'),
                  onChanged: (String value) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hasFloatingPlaceholder: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      // hintText: 'Enter your product description',
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Password'),
                  onChanged: (String value) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      side: BorderSide(color: Colors.white)),
                  padding: EdgeInsets.only(left: 50, right: 50),
                  // color: Theme.of(context).buttonColor,
                  textColor: Colors.white,
                  child: Text('Register'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/SpendingPage');
                    
                    // Navigator.pushReplacement(   // replcet the curent layout unlike push that just creates new page
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext cotext) => HomePage()));

                    // Using Routes

                    Navigator.pushNamed(context, '/home');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
