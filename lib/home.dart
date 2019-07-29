import 'package:flutter/material.dart';
import 'package:flutter_challange_login_signup_page/login_page.dart';
import 'package:flutter_challange_login_signup_page/postARide.dart';
import 'package:flutter_challange_login_signup_page/postedRides.dart';
import 'package:flutter_challange_login_signup_page/requestedRides.dart';
import 'postARide.dart';
import 'requestARide.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('RideShare'),
        backgroundColor: Color(0xFFE65100),

      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text('Home'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Home(),
                ));
              },
            ),
            new ListTile(
              title: new Text('Posted Rides'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PostedRides(),
                ));
              },
            ),
            new ListTile(
              title: new Text('Requested Rides'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => RequestedRides(),
                ));
              },
            ),
            new ListTile(
              title: new Text('Post A Ride'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PostARide(),
                ));
              },
            ),
            new ListTile(
              title: new Text('Request A Ride'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => RequestARide(),
                ));
              },
            ),
            new ListTile(
              title: new Text('Log Out'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
            ),
          ],
        ),
      ),
      body: new Center(
          child: new Text('Welcome To The RideSharing App... You can Save lots of \$ here. '
              'You will be indirectly responsible for the Pollution reduction by using this App. '
              'So be Proud using this App. '
              'Please select the Options in the left-top Options bar... '
              'Thank You for using this App and making this earth a Wonderful Place... ',
              style: TextStyle(fontSize: 24.0, color: Colors.black))
      ),
      //FAB is a property of the `Scaffold` Widget

      /*floatingActionButton: FloatingActionButton.extended(
        //child: Icon(Icons.add),
        label: Text('Post a Ride'),
        //Widget to display inside Floating Action Button, can be `Text`, `Icon` or any widget.
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostARide()),
          );
        },
      ),*/

    );
  }
}