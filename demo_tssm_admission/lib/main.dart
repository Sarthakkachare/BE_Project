
// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:file_picker/file_picker.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'File Picker Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FilePickerDemo(),
//     );
//   }
// }

// class FilePickerDemo extends StatefulWidget {
//   @override
//   _FilePickerDemoState createState() => _FilePickerDemoState();
// }

// class _FilePickerDemoState extends State<FilePickerDemo> {
//   String _filePath1 = '';
//   String _filePath2 = '';
//   FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<void> _uploadFile(File file, String fileName) async {
//     try {
//       await _storage.ref('files/$fileName').putFile(file);
//     } on FirebaseException catch (e) {
//       print('Error uploading file: $e');
//     }
//   }

//   void _pickFile(int containerNumber) async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles();

//       if (result != null) {
//         File file = File(result.files.single.path!);
//         String fileName = basename(file.path);

//         setState(() {
//           if (containerNumber == 1) {
//             _filePath1 = fileName;
//           } else if (containerNumber == 2) {
//             _filePath2 = fileName;
//           }
//         });

//         await _uploadFile(file, fileName);
//       }
//     } on PlatformException catch (e) {
//       print("Unsupported operation" + e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Picker Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 200,
//               height: 100,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blue),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.insert_drive_file),
//                     onPressed: () => _pickFile(1),
//                   ),
//                   Text(_filePath1),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               width: 200,
//               height: 100,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blue),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.insert_drive_file),
//                     onPressed: () => _pickFile(2),
//                   ),
//                   Text(_filePath2),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// Simport 'package:demo_tssm_admission/database/db.dart';

import 'Starting_pages/firstpage.dart';
import 'package:flutter/material.dart';  
import 'package:firebase_core/firebase_core.dart';
// import 'admin.dart';
import 'firebase_options.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //await DatabaseMethods.getAllStudentData();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:FirstPage(),
    );
  }
} 

