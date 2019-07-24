import 'package:flutter/material.dart';
import 'package:flutter_challange_login_signup_page/home.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart' show Firestore;
import 'package:uuid/uuid.dart';

class RequestARide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage2(title: 'Well data'),
    );
  }
}


class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {

  /* Form key used to validate the inputs */
  final _formKey = new GlobalKey<FormState>();

  /* Scafold key to show a snackbar*/
  final _scafoldKey = new GlobalKey<ScaffoldState>();

  /* Variables where we store inputs data */
  String _firstName, _lastName, _phoneNumber, _from, _to,
      _travelDate = DateTime.now().toString(), _cost, _seats, _carType;

  /* Firestore instance used to insert or fetch from the database */
  final Firestore _fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        title: Text("Request A Ride"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Text(
                  "First Name",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                      hintText: "First Name"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Please enter your First Name!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _firstName = value;
                  },
                ),
              ),
              ListTile(
                leading: Text(
                  "Last Name",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                      hintText: "<Last Name>"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Please enter your Last Name!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lastName = value;
                  },
                ),
              ),
              ListTile(
                leading: Text(
                  "Phone Number",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                      hintText: "<Phone Number>"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Please enter your Phone Number!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phoneNumber = value;
                  },
                ),
              ),
              ListTile(
                leading: Text(
                  "From",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                      hintText: "<From>"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Please enter from where you're travelling!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _from = value;
                  },
                ),
              ),
              ListTile(
                leading: Text(
                  "to",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                      hintText: "<to>"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Please enter where you're travelling!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _to = value;
                  },
                ),
              ),

              ListTile(
                leading: Text(
                  "Travel Date",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                title: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final datePicker = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: new DateTime(2019),
                      lastDate: new DateTime(2100),
                    );
                    if( datePicker != null) {
                      _travelDate = datePicker.toString();
                    }
                  },
                ),
              ),
              ListTile(
                leading: Text(
                  "Cost",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                      hintText: "<Cost>"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Please enter the cost of travel!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cost = value;
                  },
                ),
              ),
              ListTile(
                leading: Text(
                  "No. of Seats Available",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                      hintText: "<No. of Seats available>"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Please enter the number of seats available!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _seats = value;
                  },
                ),
              ),
              ListTile(
                leading: Text(
                  "Car Type",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                      hintText: "<Car Type>"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Please enter the Car Type!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _carType = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    if(_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      /* Uuid().v1() will generate a time based random unique ID to use as a document name. Because firestore is a NoSQL database*/
                      await _fireStore.collection('RequestRide').document(Uuid().v1()).setData({
                        'firstName' : _firstName,
                        'Last Name' : _lastName,
                        'Phone Number' : _phoneNumber,
                        'From' : _from,
                        'To' : _to,
                        'Travel Date' : _travelDate,
                        'Cost' : _cost,
                        'Seats Available' : _seats,
                        'Car Type' : _carType
                      });
                      _scafoldKey.currentState.showSnackBar(SnackBar(content: Text("INSERTED TO FIRESTORE!"),));
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
