import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import'API.dart';
import 'dart:convert';
import 'package:http/http.dart';

String fileName;
String path;
Map<String, String> paths;
List<String> extensions;
bool isLoadingPath = false;
bool isMultiPick = true;
FileType fileType;
String QueryText;
String url;
String Data;

void main() {
  runApp(FilePickerApp());
  print(fileName);

}


class FilePickerApp extends StatefulWidget {


  @override
  FilePickerAppState createState() => new FilePickerAppState();
}

class FilePickerAppState extends State<FilePickerApp> {


  _openFileExplorer() async {
    //UNDERSTOOD
    setState(() => isLoadingPath = true);
    try {
      path = null;
      paths = await FilePicker.getMultiFilePath(
          type: fileType != null ? fileType : FileType.any,
          allowedExtensions: extensions); //MULTI FILE PICKER
    }
    on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }

    if (!mounted) return;
    setState(() {
      isLoadingPath = false;
      if (path != null) {
        fileName = path
            .split('/')
            .last;
      } else {
        fileName = paths != null
            ? paths.keys.toString() : '...';
      }
      /////use navigator to copy path value

    });

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('UPLOAD FILE!!'),
          backgroundColor: Colors.brown,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: new RaisedButton(
                  onPressed: () {
                    print (_openFileExplorer());
                  },
                  child: new Text("Choose from Device"),
                  color: Colors.brown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (value) {
                    url = ' https://6143ebc8954a.ngrok.io/api?Query=' + value.toString();
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter File Path',
                      suffixIcon: GestureDetector(
                          onTap: () async {
                            Data = await Getdata(url);
                            var DecodedData = jsonDecode(Data);
                            setState(() {
                              QueryText = DecodedData['Query'];
                            });
                          },
                          child: Icon(Icons.search))),
                ),
              ),
              Text(QueryText),
              new Builder(
                builder: (BuildContext context) => isLoadingPath ? Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: const CircularProgressIndicator()
                )
                    :path != null || paths != null ? new Container(
                     padding: const EdgeInsets.only(bottom: 30.0),
                     height: MediaQuery.of(context).size.height * 0.50,
                      child: new Scrollbar(
                        child: new ListView.separated(
                          itemCount: paths != null && paths.isNotEmpty ? paths.length : 1,
                          itemBuilder: (BuildContext context, int index) {
                          final bool isMultiPath = paths != null && paths.isNotEmpty;
                          final int fileNo = index + 1;
                          final String name = 'File $fileNo : ' +
                              (isMultiPath ? paths.keys.toList()[index] : fileName ?? '...');
                          final filePath = isMultiPath
                              ? paths.values.toList()[index].toString() : path;

                          return new ListTile(title: new Text(name,),
                            subtitle: new Text(filePath),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => new Divider(),
                      )
                  ),
                )
                    : new Container(),

              ),
            ],
          ),
        ),
      ),);
  }
}


























// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:file_picker/file_picker.dart';
// //import 'package:secure_file_sharing/globals.dart' as globals;
//
// //GLobal Variable
// String fileName;
// String path;
// Map<String, String> paths;
// List<String> extensions;
// bool isLoadingPath = false;
// bool isMultiPick = false;
// FileType fileType;
//
// void main() {
//   runApp(FilePickerApp());
//   print(fileName);
// }
//
// class FilePickerApp extends StatefulWidget {
//
//
//   @override
//   FilePickerAppState createState() => new FilePickerAppState();
// }
//
// class FilePickerAppState extends State<FilePickerApp> {
//
//   // FilePickerAppState();
//   // FilePickerAppState.createFilePickerAppState(this.fileName, this.path, this.fileType, this.extensions);
//   //
//   // List<String> get extension => extensions;
//   //
//   // FileType get fType => fileType;
//   //
//   // String get pth => path;
//   //
//   // String get fName => fileName;
//
//
//
//   void _openFileExplorer() async {
//     setState(() => isLoadingPath = true);
//     try {
//       if (isMultiPick) {
//         path = null;
//         paths = await FilePicker.getMultiFilePath(type: fileType != null? fileType: FileType.any, allowedExtensions: extensions);
//       }
//       else {
//         path = await FilePicker.getFilePath(type: fileType != null? fileType: FileType.any, allowedExtensions: extensions);
//         paths = null;
//       }
//     }
//     on PlatformException catch (e) {
//       print("Unsupported operation" + e.toString());
//     }
//     if (!mounted) return;
//     setState(() {
//       isLoadingPath = false;
//       fileName = path != null ? path.split('/').last : paths != null
//           ? paths.keys.toString() : '...';
//       /////use navigator to copy path value
//     });
//     print(fileName);
//     var fn = fileName;
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: const Text('UPLOAD FILE!!'),
//           backgroundColor: Colors.brown,
//         ),
//         body: new Center(
//             child: new Padding(
//               padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//               child: new SingleChildScrollView(
//                 child: new Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//
//                     new Padding(
//                       padding: const EdgeInsets.only(top: 20.0),
//                       child: new DropdownButton(
//                           hint: new Text('Select file type'),
//                           value: fileType,
//                           items: <DropdownMenuItem>[
//                             new DropdownMenuItem(
//                               child: new Text('Audio'),
//                               value: FileType.audio,
//                             ),
//                             new DropdownMenuItem(
//                               child: new Text('Image'),
//                               value: FileType.image,
//                             ),
//                             new DropdownMenuItem(
//                               child: new Text('Video'),
//                               value: FileType.video,
//                             ),
//                             new DropdownMenuItem(
//                               child: new Text('Any'),
//                               value: FileType.any,
//                             ),
//                           ],
//                           onChanged: (value) => setState(() {
//                             fileType = value;
//                           })
//                       ),
//                     ),
//                     new ConstrainedBox(
//                       constraints: BoxConstraints.tightFor(width: 200.0),
//                       child: new SwitchListTile.adaptive(
//                         title: new Text('Pick multiple files', textAlign: TextAlign.left),
//                         onChanged: (bool value) => setState(() => isMultiPick = value),
//                         value: isMultiPick,
//                       ),
//                     ),
//                     new Padding(
//                       padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
//                       child: new RaisedButton(
//                         onPressed: () {
//                           _openFileExplorer();
//                           },
//                         child: new Text("Select"),
//                         color: Colors.brown,
//                       ),
//                     ),
//                     new Builder(
//                       builder: (BuildContext context) => isLoadingPath ? Padding(
//                           padding: const EdgeInsets.only(bottom: 10.0),
//                           child: const CircularProgressIndicator()
//                       )
//                           : path != null || paths != null ? new Container(
//                         padding: const EdgeInsets.only(bottom: 30.0),
//                         height: MediaQuery.of(context).size.height * 0.50,
//                            child: new Scrollbar(
//
//                             child: new ListView.separated(
//                               itemCount: paths != null && paths.isNotEmpty ? paths.length : 1,
//                               itemBuilder: (BuildContext context, int index) {
//                                 final bool isMultiPath = paths != null && paths.isNotEmpty;
//                                 final int fileNo = index + 1;
//                                 final String name = 'File $fileNo : ' +
//                                     (isMultiPath ? paths.keys.toList()[index] : fileName ?? '...');
//                                 final filePath = isMultiPath
//                                     ? paths.values.toList()[index].toString() : path;
//
//                                 return new ListTile(title: new Text(name,),
//                                   subtitle: new Text(filePath),
//                                 );
//                               },
//                               separatorBuilder: (BuildContext context, int index) => new Divider(),
//                             )),
//                       )
//                           : new Container(),
//                     ),
//                   ],
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
//
// }
// // class FileMetadata extends FilePickerApp {
// //   print();
// //   var fn = fileName
// // }
// //
// // class MyService extends FilePickerAppState {
// //
// //   static final MyService _instance = MyService._internal();
// //
// //   // passes the instantiation to the _instance object
// //   factory MyService() => _instance;
// //
// //   //initialize variables in here
// //   MyService._internal() {
// //     _myVariable = fName ;
// //   }
// //
// //   String _myVariable;
// //
// //   //short getter for my variable
// //   String get myVariable => _myVariable;
// //   String get fName => fileName;
// //
// //   //short setter for my variable
// //   set myVariable(String value) => myVariable = value;
// //
// //   void filename() => print(_myVariable);
// // }





