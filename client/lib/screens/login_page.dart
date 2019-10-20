import 'dart:async';
import 'dart:convert';
import 'globals.dart' as globals;

import 'package:client/screens/spending.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPage createState() => _LoginPage();
}

Future<void> _loginAlert(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("Invalid Login"),
            content: Text("This login is invalid. Please try again."),
            actions: <Widget>[
              FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ]);
      });
}

class _LoginPage extends State<LoginPage> with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNController = TextEditingController();
  final _lastNController = TextEditingController();
  final _emailController = TextEditingController();
  final _pass2Controller = TextEditingController();

  Future<String> _makePostReqLog(String u, String p) async {
    String url = 'https://shielded-wildwood-49373.herokuapp.com/user/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    Map<String, String> json = {"email": u, "password": p};
    //String json = '{"userId":1, "id":1, "title":"abc", "body":"tre"}';
    Response response =
        await post(url, headers: headers, body: jsonEncode(json));

    int statusCode = response.statusCode;

    return response.body;
  }

  Future<String> _makeGetReqLog(String t) async {
    String url = 'https://shielded-wildwood-49373.herokuapp.com/user';
    Map<String, String> headers = {"Content-type": "application/json", "authorization": t};
    Response response = await get(url, headers: headers);
    print(response.body);
    return response.body;
  }

  Future<String> _makePostReqReg(String f, String l, String e, String p) async {
    String url = 'https://shielded-wildwood-49373.herokuapp.com/user/signup';
    Map<String, String> headers = {"Content-type": "application/json"};
    Map<String, String> json = {
      "firstName": f,
      "lastName": l,
      "email": e,
      "password": p
    };
    //String json = '{"userId":1, "id":1, "title":"abc", "body":"tre"}';
    Response response =
        await post(url, headers: headers, body: jsonEncode(json));

    int statusCode = response.statusCode;

    String body = response.body;
    return body;
  }

  final List<Tab> myTabs = <Tab>[Tab(text: 'LOGIN'), Tab(text: 'REGISTER')];
  TabController _tabController;
  Widget _buildRegisterPage() {
    return Container(
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
      padding: EdgeInsets.all(3),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                child: Image.asset('images/logo.png'),
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
                child: TextFormField(
                  controller: _firstNController,
                  textInputAction: TextInputAction.none,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hasFloatingPlaceholder: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
              TextFormField(
                controller: _lastNController,
                keyboardType: TextInputType.text,
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
              TextFormField(
                controller: _emailController,
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
              TextFormField(
                controller: _pass2Controller,
                obscureText: true,
                keyboardType: TextInputType.text,
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
                  String fName = _firstNController.text;
                  String lName = _lastNController.text;
                  String email = _emailController.text;
                  String pass2 = _pass2Controller.text;
                  _makePostReqReg(fName, lName, email, pass2);
                  Navigator.pushNamed(context, '/UserLogin');
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginPage() {
    return Container(
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
                child: Image.asset('images/logo.png'),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Text(
                  'GatorWealth',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextFormField(
                  controller: _usernameController,
                  textInputAction: TextInputAction.none,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hasFloatingPlaceholder: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      // hintText: 'Enter your product title',
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Email Address'),
                  onChanged: (String value) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.text,
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
                child: Text('Login'),
                onPressed: () async {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  String resultLog = await _makePostReqLog(username, password);
                  print(resultLog);
          
                  if (resultLog == "Unauthorized") {
                    Navigator.pushNamed(context, '/UserLogin');
                    _loginAlert(context);
                  } else {
                    Map<String, dynamic> tokenGenerated = jsonDecode(resultLog);
                    String firstNameFound = await _makeGetReqLog(tokenGenerated["token"]);
                    Map<String, dynamic> nameThere = jsonDecode(firstNameFound);
                    globals.name = "${nameThere["name"].toUpperCase()[0]}${nameThere["name"].substring(1)}";
                    Navigator.pushNamed(
                      context,
                      '/SpendingPage',
                      arguments: SpendingPage(
                        name: 'Vishvak Seenichamy',
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new TabBar(
        labelPadding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        labelColor: Colors.blue,
        indicatorColor: Colors.lightBlueAccent,
        controller: _tabController,
        tabs: myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          if (tab.text == 'LOGIN') {
            return _buildLoginPage();
          } else {
            return _buildRegisterPage();
          }
        }).toList(),
      ),
    );
  }
}
