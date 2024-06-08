import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_tssm_admission/id.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

List<Map<String, dynamic>> allStudentData = [];
String userID = UserID.email;
CollectionReference collectionRef = FirebaseFirestore.instance.collection('students');

class DatabaseMethods {

    static Future<List<Map<String, dynamic>>> getAllStudentData() async {
    List<Map<String, dynamic>> allStudentData = [];

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection("students").get();

      querySnapshot.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
        Map<String, dynamic> studentData = doc.data();

        // Include document ID in the data
        studentData['id'] = doc.id;

        // Iterate through subcollections
        studentData['subcollections'] = {};

        for (String subcollection in ['currentEducationalDetails', 'firstYearAdditionalDetails', 'parentsInfo', 'personalInfo', 'previousMarks']) {
          QuerySnapshot<Map<String, dynamic>> subcollectionSnapshot =
              await doc.reference.collection(subcollection).get();

          List<Map<String, dynamic>> subcollectionData = [];

          subcollectionSnapshot.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> subdoc) {
            subcollectionData.add(subdoc.data());
          });

          studentData['subcollections'][subcollection] = subcollectionData;
        }

        allStudentData.add(studentData);
      });

      print(allStudentData);
    } catch (e) {
      print("Error getting student data: $e");
    }

    return allStudentData;
  }

  Future<void> savePersonalInfo(Map<String, dynamic> personalInfo) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("personalInfo")
        .doc("personalInfo")
        .set(personalInfo);
  }

  Future<void> saveParentsInfo(Map<String, dynamic> parentsInfo) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("parentsInfo")
        .doc("parentsInfo")
        .set(parentsInfo);
  }

  Future<void> savefirstYearAdditionalDetails(
      Map<String, dynamic> firstYearAdditionalDetails) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("firstYearAdditionalDetails")
        .doc("firstYearAdditionalDetails")
        .set(firstYearAdditionalDetails);
  }

  Future<void> savepreviousMarks(Map<String, dynamic> previousMarks) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("previousMarks")
        .doc("previousMarks")
        .set(previousMarks);
  }

  Future<void> saveseRegularAdmissionDetails(
      Map<String, dynamic> seRegularAdmissionDetails) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("seRegularAdmissionDetails")
        .doc("seRegularAdmissionDetails")
        .set(seRegularAdmissionDetails);
  }

  Future<void> savePreviousYearsEducationalDetails(
      Map<String, dynamic> previousYearsEducationalDetails) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("previousYearsEducationalDetails")
        .doc("previousYearsEducationalDetails")
        .set(previousYearsEducationalDetails);
  }

  Future<void> savefeMarks(Map<String, dynamic> feMarks) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("feMarks")
        .doc("feMarks")
        .set(feMarks);
  }

  Future<void> saveseMarks(Map<String, dynamic> seMarks) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("seMarks")
        .doc("seMarks")
        .set(seMarks);
  }

  Future<void> saveteMarks(Map<String, dynamic> teMarks) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("teMarks")
        .doc("teMarks")
        .set(teMarks);
  }

  Future<void> savecurrentEducationalDetails(
      Map<String, dynamic> currentEducationalDetails) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("currentEducationalDetails")
        .doc("currentEducationalDetails")
        .set(currentEducationalDetails);
  }

  // Future<void> saveDocuments(Map<String, dynamic> documents) async {
  //   await FirebaseFirestore.instance
  //       .collection("students")
  //       .doc(userID)
  //       .collection("documents")
  //       .doc("documents")
  //       .set(documents);
  // }

  Future<void> saveAcademicDetails(Map<String, dynamic> academicDetails) async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(userID)
        .collection("academicDetails")
        .doc("academicDetails")
        .set(academicDetails);
  }


Future<void> uploadFileToFirebase(String documentName, File file) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference storageReference =
          storage.ref().child('uploads/$userID/$documentName/${basename(file.path)}');
      UploadTask uploadTask = storageReference.putFile(file);
      await uploadTask.whenComplete(() => print('File Uploaded'));
    } catch (e) {
      print("Error uploading file: $e");
    }
  }
  
  // Future<void> uploadFile(File file) async {
  //   try {
  //     FirebaseStorage storage = FirebaseStorage.instance;
  //     Reference storageReference =
  //         storage.ref().child('uploads/userids/${basename(file.path)}');
  //     UploadTask uploadTask = storageReference.putFile(file);
  //     await uploadTask.whenComplete(() => print('File Uploaded'));
  //   } catch (e) {
  //     print("Error uploading file: $e");
  //   }
  // }
  
}
