
/*
class Form extends StatefulWidget {
  Form({Key key, Column child}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          `TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),`
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
*/
//
// // Define a custom Form widget.
// class MyCustomForm extends StatefulWidget {
//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }
//
// // Define a corresponding State class.
// // This class holds data related to the form.
// class MyCustomFormState extends State<MyCustomForm> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a `GlobalKey<FormState>`,
//   // not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: <Widget>[
//           // Add TextFormFields and ElevatedButton here.
//           Container(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 // The validator receives the text that the user has entered.
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                     border: UnderlineInputBorder(), labelText: ''),
//               ),
//             ),
//             //color: Colors.blueGrey,
//             margin: const EdgeInsets.all(20.0),
//             height: 40,
//             width: 1000,
//           ),
//           Container(
//             child: RaisedButton(
//               child: Text('SUBMIT'),
//               onPressed: () => 'pressed',
//               elevation: 3,
//             ),
//             color: Colors.blueGrey,
//             margin: const EdgeInsets.all(20.0),
//             height: 60,
//             width: 100,
//           ),
//           /*ElevatedButton(
//             onPressed: () {
//               // Validate returns true if the form is valid, or false otherwise.
//               if (_formKey.currentState!.validate()) {
//                 // If the form is valid, display a snackbar. In the real world,
//                 // you'd often call a server or save the information in a database.
//                 ScaffoldMessenger.of(context)
//                     .showSnackBar(SnackBar(content: Text('Processing Data')));
//               }
//             },
//             child: Text('Submit'),
//           ),*/
//         ],
//       ),
//     );
//   }
// }
//}





// pickFile() async {
//   // var file = await FilePicker.platform.pickFiles();
//
//   var result = await FilePicker.getFile(FileType type: FileType.any)
//   if (result != null) {
//
//   }




//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         // appBar: AppBar(
//         //   title: Text('SECURE FILE SHARING'),
//         // ),
//
//         body: new Stack(
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       "https://cdn3.f-cdn.com//files/download/113468655/79d057.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             //FilePickerApp(),
//             FilePickerApp(),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(50.0, 483.0, 50.0, 50.0),
//               child: Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       'UPLOAD HERE!!',
//                       style: TextStyle(
//                           fontSize: 30,
//                           color: Colors.white70
//                       ),)
//                   ],
//                   mainAxisAlignment: MainAxisAlignment.start,
//
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }

