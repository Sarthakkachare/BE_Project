import 'dart:typed_data';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_tssm_admission/database/db.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'Payment.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'id.dart';

String userID = UserID.email;

class Documents extends StatefulWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  Map<String, Uint8List?> selectedDocuments = {
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
    'Migration Certificate (If Applicable)': null,
    'Age, Nationality, Domicile / Birth Certificate (If Applicable)': null,
    'Caste Certificate (If Applicable)': null,
    'Caste Validity Certificate (If Applicable)': null,
    'Non Creamy-layer (If Applicable)': null,
    'Income certificate (If Applicable)': null,
    'EWS certificate (If Applicable)': null,
    'Gap certificate (If Applicable)': null,
    'Aadhar Card': null,
    'Pan Card': null,
    'Student Passport Size Photo': null,
    'Confirmation Letter': null,
  };

  Map<String, String?> selectedFileNames = {
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
    'Migration Certificate (If Applicable)': null,
    'Age, Nationality, Domicile / Birth Certificate (If Applicable)': null,
    'Caste Certificate (If Applicable)': null,
    'Caste Validity Certificate (If Applicable)': null,
    'Non Creamy-layer (If Applicable)': null,
    'Income certificate (If Applicable)': null,
    'EWS certificate (If Applicable)': null,
    'Gap certificate (If Applicable)': null,
    'Aadhar Card': null,
    'Pan Card': null,
    'Student Passport Size Photo': null,
    'Confirmation letter': null,
  };
  DatabaseMethods dbmObj = DatabaseMethods();

  // Future<void> _pickDocument(String documentName) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
  //   );

  //   if (result != null && result.files.isNotEmpty) {
  //     Uint8List? documentBytes = result.files.first.bytes;
  //     String? fileName = result.files.first.name;

  //     if (documentBytes != null) {
  //       print("Calling uploadDocumentToStorage...");
  //       await uploadDocumentToStorage(documentBytes, fileName);
  //     }

  //     print("object");
  //     setState(() {
  //       selectedDocuments[documentName] = result.files.first.bytes;
  //       selectedFileNames[documentName] = result.files.first.name;
  //     });
  //     print("setState");
  //   }
  // }

  // Future<void> uploadDocumentToStorage(Uint8List documentData, String fileName) async {
  //   print("in upload doc function");
  //   try {
  //     print("in upload doc functions try block");
  //     print("Uploading document: $fileName");

  //     Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
  //     await storageRef.putData(documentData);

  //     String downloadURL = await storageRef.getDownloadURL();

  //     print("Document uploaded successfully: $fileName");

  //     await FirebaseFirestore.instance
  //         .collection("students")
  //         .doc(userID)
  //         .collection("documents")
  //         .doc(fileName)
  //         .set({
  //       'fileName': fileName,
  //       'downloadURL': downloadURL,
  //     });

  //     print('Document uploaded to Firestore: $fileName');
  //   } catch (e) {
  //     print('Error uploading document: $e');
  //   }
  //   print("in upload doc functions after try block");
  // }

  
  

  Future<void> _pickDocument(String documentName) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
  );

  if (result != null && result.files.isNotEmpty) {
    PlatformFile file = result.files.first;
    Uint8List? documentBytes = file.bytes;
    String? fileName = file.name;
    String? filePath = file.path;

    setState(() {
      selectedDocuments[documentName] = documentBytes;
      selectedFileNames[documentName] = filePath;
    });

    // Upload the selected file to Firebase Storage
    Reference ref = FirebaseStorage.instance.ref().child('documents/$fileName');
    UploadTask uploadTask = ref.putData(documentBytes!);

    // Await the completion of the upload task
    await uploadTask.whenComplete(() => print('File uploaded to Firebase Storage'));
  } else {
    // Handle the case when no file is selected or the selected file is null
    print('No file selected');
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
              for (var entry in selectedDocuments.entries)
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
                                  selectedFileNames[entry.key] ??
                                      "No file selected",
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
                          onPressed: () => _pickDocument(entry.key),
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
                  // style: ButtonStyle(
                  //             backgroundColor: const MaterialStatePropertyAll( Color.fromARGB(255, 116, 230, 240),),
                  //             fixedSize: const MaterialStatePropertyAll(Size(150, 50)),
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
