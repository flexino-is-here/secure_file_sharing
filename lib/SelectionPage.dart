import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secure_file_sharing/FilePicker.dart';


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
        home: SelectionPage()

    );
  }
}


// ignore: camel_case_types
class SelectionPage extends StatefulWidget {
  SelectionPage({Key key, String title}) : super(key: key);

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

// ignore: camel_case_types
class _SelectionPageState extends State<SelectionPage> {


  @override

  Widget build(BuildContext context) {
    //return Image(image: AssetImage('images\\cactus.jpeg'),);

    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
          decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://i.ibb.co/PQnJF94/HHHHH.png"), fit: BoxFit.cover,
                  ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 483.0, 50.0, 50.0),
            child: Center(
              child: Column(
                children: [
                  IconButton(
                      icon: Icon(Icons.file_upload),
                      iconSize: 50,
                      color: Colors.brown,
                      tooltip: 'Send Files!',
                      onPressed: () {
                        return Navigator.push(context, new MaterialPageRoute(builder: (context) => new FilePickerApp())
                        );
                      },
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 650.0, 50.0, 50.0),
            child: Center(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.file_download),
                    iconSize: 50,
                    color: Colors.brown,
                    tooltip: 'Recieve Files!',
                    onPressed: () {
                      //for download
                    },
                  ),
                ],
              ),
            ),
          ),

        ],),
      );

      //bottomNavigationBar: BottomAppBar( color: Colors.blueGrey, child: Container( height: 50.0),),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,);
  }
}