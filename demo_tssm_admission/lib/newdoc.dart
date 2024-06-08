import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';

import 'Payment.dart';
import 'database/db.dart';

class FilePickerScreen1 extends StatefulWidget {
  @override
  _FilePickerScreen1State createState() => _FilePickerScreen1State();
}

class _FilePickerScreen1State extends State<FilePickerScreen1> {
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
    _pickFileFromDevice((File file) async {
      setState(() {
        selectedFiles[documentName] = file;
      });

      // Check file size
      int fileSize = await file.length();
      if (fileSize <= 500 * 1024) {
        // If file size is less than or equal to 500 KB, upload the file
         DatabaseMethods().uploadFileToFirebase(documentName, file);
      } else {
        // If file size exceeds 500 KB, show an error message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("File Size Exceeded"),
              content: Text("The selected file exceeds the maximum allowed size of 500 KB."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    });
  }

  Future<void> _pickFileFromDevice(Function(File) onFilePicked) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        File file = File(result.files.single.path!);
        int fileSize = await file.length();
        if (fileSize <= 500 * 1024) {
          onFilePicked(file);
        } else {
          // Show an error message if the file size exceeds the limit
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("File Size Exceeded"),
                content: Text("The selected file exceeds the maximum allowed size of 500 KB."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
  }

  Future<void> _openDocument(String? filePath) async {
    if (filePath != null) {
      // Check if the file exists
      File file = File(filePath);
      if (await file.exists()) {
        // Open the file using platform specific method
        await OpenFile.open(filePath);
      } else {
        // Show an error message if the file doesn't exist
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("File Not Found"),
              content: Text("The selected file doesn't exist."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shadowColor: const Color.fromARGB(255, 136, 213, 212),
        elevation: 15,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        title: const Text(
          "Documents",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
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
                                Container(
                                  width: 150,
                                  child: Text(
                                    overflow: TextOverflow.fade,
                                    selectedFiles[entry.key]?.path ?? "No file selected",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                               Spacer(),
                                ElevatedButton(
                                  
                                  onPressed: () => _openDocument(selectedFiles[entry.key]?.path),
                                  style: ElevatedButton.styleFrom(
                                   // fixedSize: Size(60, 10),
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color.fromARGB(255, 14, 154, 167), // Adjust button color as needed
                                  ),
                                  child: const Text("View"),
                                ),
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
                  backgroundColor: const Color.fromARGB(255, 14, 154, 167),
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
