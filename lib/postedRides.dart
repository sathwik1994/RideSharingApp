import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show Firestore;
import 'package:intl/intl.dart';

class PostedRides extends StatefulWidget {
  PostedRides({Key key, this.title}) : super(key: key);
  final String title ;
  @override
  _PostedRides createState() => _PostedRides();
}

class _PostedRides extends State<PostedRides> {

  Firestore _fireStore1 = Firestore.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posted Rides"),
        backgroundColor: Color(0xFFE65100),
      ),
      body: StreamBuilder(
        stream: _fireStore1.collection('PostRide').snapshots(),
        builder: (context,snapshot) {
          if(snapshot.hasError) {
            return Center(
              child: Text("Error retrieving data!"),
            );
          }else if(!snapshot.hasData) {
            return Center(
              child: Text("No data found!"),
            );
          }else {
            QuerySnapshot query = snapshot.data;
            return ListView.builder(
              itemCount: query.documents.length,
              itemBuilder: (context,int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        'Entry',
                        arguments: query.documents[index]
                    );
                  },
                  child: Card(
                    //child: new InkWell(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(query.documents[index]['From'] == null ? "null":query.documents[index]['From'],
                              style: TextStyle(
                                color: Colors.black, fontSize: 18
                              ),),
                            Padding(padding: EdgeInsets.all(28),),
                            Text(query.documents[index]['To'] == null ? "null":query.documents[index]['To'],
                                style: TextStyle(
                                  color: Colors.black, fontSize: 18
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(query.documents[index]['Travel Date'] == null ? "null":""+_formatDate(query.documents[index]['Travel Date']),
                                style: TextStyle(
                                  color: Colors.black, fontSize: 18
                                )),
                            Padding(padding: EdgeInsets.all(14),),
                            Text(query.documents[index]['Cost'] == null ? "null":query.documents[index]['Cost']+"\$",
                                style: TextStyle(
                                  color: Colors.black, fontSize: 18
                                )),
                            Text(" "),
                            Text(" "),
                            Text(" "),
                            Text(query.documents[index]['Seats Available'] == null ? "null":query.documents[index]['Seats Available'],
                                style: TextStyle(
                                  color: Colors.black, fontSize: 18
                                )),
                          ],

                        ),

                      ],
                    ),

                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  String _formatDate(String date) {
    DateTime d = DateTime.parse(date);
    return DateFormat("dd-MM-yyyy").format(d);
  }
}

class DataScreen1 extends StatelessWidget {
  DataScreen1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final DocumentSnapshot doc = ModalRoute.of(context).settings.arguments;
    List<dynamic> values = doc.data.values.toList();
    List<dynamic> keys = doc.data.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: values.length,
        itemBuilder: (context,int index) {
          return Row(
            children: <Widget>[
              Text(keys[index]+": ", style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),),
              Padding(
                padding: EdgeInsets.all(28),
              ),
              Text(values[index] == null ? "null":values[index], style: TextStyle(color: Colors.black, fontSize: 14),),
            ],
          );
        },
      ),
    );
  }
}
