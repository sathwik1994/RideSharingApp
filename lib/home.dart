import 'package:flutter/material.dart';
import 'package:flutter_challange_login_signup_page/login_page.dart';
import 'package:flutter_challange_login_signup_page/postARide.dart';
import 'postARide.dart';
import 'requestARide.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /* return new Scaffold(
        appBar: new AppBar(

          title: Text('Available Rides'),
        ),
        body: new Center(

          child: new Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'You have pushed the button this many times:',
              ),
              new Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: new Container(
          height: 140.0,
          child: new Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      child: new FloatingActionButton(
                        onPressed: _incrementCounter,
                        tooltip: 'Increment',
                        child: new Icon(Icons.add),
                      ),
                    ),
                    new Container(
                      height: 20.0,
                    ), // a space
                    Container(
                      height: 60.0,
                      child: new FloatingActionButton(
                        onPressed: _decremenrCounter,
                        backgroundColor: Colors.red,
                        tooltip: 'Increment',
                        child: new Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Posted Rides'),
        backgroundColor: Color(0xFF293b72),

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
                  builder: (context) => PostARide(),
                ));
              },
            ),
            new ListTile(
              title: new Text('Requested Rides'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PostARide(),
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
                /*Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));*/
              },
            ),
          ],
        ),
      ),
      body: new Center(
          child: new Text('No rides available',
              style: TextStyle(fontSize: 30.0, color: Colors.black))
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