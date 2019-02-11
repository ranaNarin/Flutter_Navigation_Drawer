import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_drawer/new_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      home: new HomePage(),
//      routes: <String, WidgetBuilder>{
//        "/a": (BuildContext context) => new NewPage("New Page"),
//      },

     
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Navigation Drawer"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Narinder Rana"),
              accountEmail: new Text("rana.narin@mgmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Theme.of(context).platform==
                    TargetPlatform.iOS
                    ? Colors.redAccent
                    : Colors.white,
                child: new Text("N"),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Theme.of(context).platform==
                      TargetPlatform.iOS
                      ? Colors.redAccent
                      : Colors.white,
                  child: new Text("S"),
                )
              ],
            ),
            new ListTile(
              title: new Text("Settings"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
               // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>new NewPage("Settings")
                ));
              }
            ),
            new ListTile(
              title: new Text("About us"),
              trailing: new Icon(Icons.arrow_downward),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).pushNamed("/a");
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context)=>new NewPage("About us")
                  ));
                }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Log out"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Home Page"),
        ),
      ),
    );
  }
}
