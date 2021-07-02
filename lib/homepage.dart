import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'SelectionPage.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: homepage()

    );
  }
}


class homepage extends StatefulWidget {
  homepage({Key key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override

  Widget build(BuildContext context) {
    //return Image(image: AssetImage('images\\cactus.jpeg'),);
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage(
        "https://i.ibb.co/GPdb5tQ/secureshare-2.png"), fit: BoxFit.cover,
        ),
        ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         return Navigator.push(context, new MaterialPageRoute(builder: (context) => new SelectionPage())   //////////////////////////////////////////////
         );
        },
        child: Icon(
          Icons.navigate_next,
        ),
        heroTag: "demoTag",
      ),
      //bottomNavigationBar: BottomAppBar( color: Colors.blueGrey, child: Container( height: 50.0),),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Align(
      //alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {},
        child: const Text('GET STARTED', style: TextStyle(fontSize: 20)),
        color: Colors.transparent,
        textColor: Colors.brown,
        elevation: 5,
      ),
    );
  }
}

