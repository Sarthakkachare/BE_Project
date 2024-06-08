
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:file_picker/file_picker.dart';

// import 'database/db.dart';
// import 'id.dart';

// String userid = UserID.email;
// var dbobj = DatabaseMethods();

// class FilePickerScreen extends StatefulWidget {
//   @override
//   _FilePickerScreenState createState() => _FilePickerScreenState();
// }

// class _FilePickerScreenState extends State<FilePickerScreen> {
//   Map<String, File?> selectedFiles = {
//     'Allotment Letter': null,
//     'CET/GATE/JEE/AAT Score Card/Score sheet': null,
//     'S.S.C Mark sheet': null,
//     'S.S.C Board Certificate': null,
//     'H.S.C Mark sheet': null,
//     'H.S.C Board Certificate': null,
//     'Diploma Mark sheet': null,
//     'Diploma Provisional Certificate': null,
//     'Degree Mark sheet': null,
//     'Degree Provisional Certificate': null,
//     'Leaving / T.C Certificate': null,
//     'Migration Certificate': null,
//     'Age': null,
//     'Nationality': null,
//     'Domicile / Birth Certificate': null,
//     'Caste Certificate': null,
//     'Caste Validity Certificate': null,
//     'Non Creamy-layer': null,
//     'Income certificate': null,
//     'EWS certificate': null,
//     'Gap certificate': null,
//     'Aadhar Card': null,
//     'Pan Card': null,
//     'Student Passport Size Photo': null,
//     'Confirmation letter': null,
//   };

//   Future<void> _pickFile(String documentName) async {
//     _pickFileFromDevice((File file) {
//       setState(() {
//         selectedFiles[documentName] = file;
//       });
//       dbobj.uploadFileToFirebase(documentName, file);
//     });
//   }

//   Future<void> _pickFileFromDevice(Function(File) onFilePicked) async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles();
//       if (result != null) {
//         File file = File(result.files.single.path!);
//         onFilePicked(file);
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
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: selectedFiles.keys.map((documentName) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GestureDetector(
//                 onTap: () => _pickFile(documentName),
//                 child: Container(
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: Text(
//                       selectedFiles[documentName] != null
//                           ? basename(selectedFiles[documentName]!.path)
//                           : 'Select $documentName',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

import 'Payment.dart';
import 'database/db.dart';
import 'id.dart';

String userid = UserID.email;
var dbobj = DatabaseMethods();

class FilePickerScreen extends StatefulWidget {
  @override
  _FilePickerScreenState createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  Map<String, File?> selectedFiles = {
    'Allotment Letter': null,
    'CET/GATE/JEE/AAT Score Card/Score sheet': null,
    'S.S.C Mark sheet': null,
    'S.S.C Board Certificate': null,
    'H.S.C Mark sheet': null,
    'H.S.C Board Certificate': null,
    'Diploma Mark sheet': null,
    'Diploma Provisional Certificate': null,
    'Degree Mark sheet': null,
    'Degree Provisional Certificate': null,
    'Leaving / T.C Certificate': null,
    'Migration Certificate': null,
    'Age': null,
    'Nationality': null,
    'Domicile / Birth Certificate': null,
    'Caste Certificate': null,
    'Caste Validity Certificate': null,
    'Non Creamy-layer': null,
    'Income certificate': null,
    'EWS certificate': null,
    'Gap certificate': null,
    'Aadhar Card': null,
    'Pan Card': null,
    'Student Passport Size Photo': null,
    'Confirmation letter': null,
  };

  Future<void> _pickFile(String documentName) async {
    _pickFileFromDevice((File file) {
      setState(() {
        selectedFiles[documentName] = file;
      });
      dbobj.uploadFileToFirebase(documentName, file);
    });
  }

  Future<void> _pickFileFromDevice(Function(File) onFilePicked) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path!);
        onFilePicked(file);
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 136, 213, 212),
        elevation: 15,
        title: const Text("Documents",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )),
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        backgroundColor: const Color.fromARGB(255, 14, 154, 167),
      ),
      backgroundColor: const Color.fromARGB(255, 229, 253, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Upload Documents",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 6, 93, 96),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "(Documents must be in pdf, jpg, jpeg or png format)",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 252, 20, 59),
                ),
              ),
              const SizedBox(height: 20),
              for (var entry in selectedFiles.entries)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  selectedFiles[entry.key]?.path ?? "No file selected",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                 Spacer(),
                                ElevatedButton(
                                  onPressed: (){},
                                  child:const Text("View") 
                                )
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => _pickFile(entry.key),
                          icon: const Icon(Icons.attach_file),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                  // Implement logic to proceed to the next screen (Payment.dart)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Payment()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 116, 230, 240),
                  fixedSize: const Size(50, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
