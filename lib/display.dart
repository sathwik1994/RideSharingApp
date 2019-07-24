import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show Firestore;
import 'package:intl/intl.dart';

class DisplayEntries extends StatefulWidget {
  DisplayEntries({Key key, this.title}) : super(key: key);
  final String title ;
  @override
  _DisplayEntriesState createState() => _DisplayEntriesState();
}

class _DisplayEntriesState extends State<DisplayEntries> {

  Firestore _fireStore = Firestore.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ride Details"),
      ),
      body: StreamBuilder(
        stream: _fireStore.collection('form').snapshots(),
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
                    margin: EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(query.documents[index]['Operator'] == null ? "null":query.documents[index]['Operator']),
                            Padding(padding: EdgeInsets.all(28),),
                            Text(query.documents[index]['Well Name'] == null ? "null":query.documents[index]['Well Name']),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(query.documents[index]['TD Date'] == null ? "null":"TD: "+_formatDate(query.documents[index]['TD Date'])),
                            Padding(padding: EdgeInsets.all(14),),
                            Text(query.documents[index]['County'] == null ? "null":query.documents[index]['County']),
                            Text(","),
                            Text(query.documents[index]['State'] == null ? "null":query.documents[index]['State']),
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

class DataScreen extends StatelessWidget {
  DataScreen({Key key, this.title}) : super(key: key);
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
              Text(values[index] == null ? "null":values[index]),
            ],
          );
        },
      ),
    );
  }
}
