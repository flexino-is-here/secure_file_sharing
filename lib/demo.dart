// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:file_picker/file_picker.dart';
// import'API.dart';
// import 'dart:convert';
//
// String fileName;
// String path;
// Map<String, String> paths;
// List<String> extensions;
// bool isLoadingPath = false;
// bool isMultiPick = true;
// FileType fileType;
// String QueryText;
// String url;
// String Data;
//
// void main() {
//   runApp(FilePickerApp());
//   print(fileName);
//
// }
//
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
//
//    _openFileExplorer() async {
//     //UNDERSTOOD
//     setState(() => isLoadingPath = true);
//     try {
//       path = null;
//       paths = await FilePicker.getMultiFilePath(
//           type: fileType != null ? fileType : FileType.any,
//           allowedExtensions: extensions); //MULTI FILE PICKER
//     }
//     on PlatformException catch (e) {
//       print("Unsupported operation" + e.toString());
//     }
//
//     if (!mounted) return;
//     setState(() {
//       isLoadingPath = false;
//       if (path != null) {
//         fileName = path
//             .split('/')
//             .last;
//       } else {
//         fileName = paths != null
//             ? paths.keys.toString() : '...';
//       }
//       /////use navigator to copy path value
//
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//           appBar: new AppBar(
//             title: const Text('UPLOAD FILE!!'),
//             backgroundColor: Colors.brown,
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                   child: new RaisedButton(
//                     onPressed: () {
//                       print (_openFileExplorer());
//                     },
//                     child: new Text("Choose from Device"),
//                     color: Colors.brown,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextField(
//                     onChanged: (value) {
//                       url = 'http://10.0.2.2:5000/api?Query=' + value.toString();
//                     },
//                     decoration: InputDecoration(
//                         hintText: 'Enter File Path',
//                         suffixIcon: GestureDetector(
//                             onTap: () async {
//                               Data = await Getdata(url);
//                               var DecodedData = jsonDecode(Data);
//                               setState(() {
//                                 QueryText = DecodedData['Query'];
//                               });
//                             },
//                             child: Icon(Icons.search))),
//                   ),
//                 ),
//                new Builder(
//                        builder: (BuildContext context) => isLoadingPath ? Padding(
//                            padding: const EdgeInsets.only(bottom: 10.0),
//                            child: const CircularProgressIndicator()
//                        )
//                        : path != null || paths != null ? new Container(
//                          padding: const EdgeInsets.only(bottom: 30.0),
//                          height: MediaQuery.of(context).size.height * 0.50,
//                             child: new Scrollbar(
//
//                              child: new ListView.separated(
//                                itemCount: paths != null && paths.isNotEmpty ? paths.length : 1,
//                                itemBuilder: (BuildContext context, int index) {
//                                  final bool isMultiPath = paths != null && paths.isNotEmpty;
//                                  final int fileNo = index + 1;
//                                  final String name = 'File $fileNo : ' +
//                                      (isMultiPath ? paths.keys.toList()[index] : fileName ?? '...');
//                                  final filePath = isMultiPath
//                                      ? paths.values.toList()[index].toString() : path;
//
//                                  return new ListTile(title: new Text(name,),
//                                    subtitle: new Text(filePath),
//                                  );
//                                },
//                                separatorBuilder: (BuildContext context, int index) => new Divider(),
//                              )
//                             ),
//                        )
//                            : new Container(),
//
//                ),
//               ],
//             ),
//           ),
//       ),);
//   }
// }
//
//
