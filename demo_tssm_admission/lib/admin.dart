import "package:demo_tssm_admission/database/db.dart";
import "package:flutter/material.dart";

Map <String,Map<String , dynamic>> stdInfo = {"personalInfo":{"firstName":"Sarthak" , "LastName":"Kachare"},"parentsInfo":{"FatherName":"Sandip" ,"MothersName":"Madhuri"},};
//Map std1 = stdData;
class AdminPanelApp extends StatelessWidget {
  const AdminPanelApp({super.key});

  //Map <String,Map<String , dynamic>> stdInfo = {"personalInfo":{"firstName":"Sarthak" , "LastName":"Kachare"},"parentsInfo":{"FatherName":"Sandip" ,"MothersName":"Madhuri"},};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Admission Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminPanelScreen(),
    );
  }
}

class AdminPanelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admission Applications'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildApplicationCard(),
              const SizedBox(height: 20),
              _buildApplicationCard(),
              const SizedBox(height: 20),
              _buildApplicationCard(),
              // Add more application cards or use ListView for scrollable list
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add new application or navigate to add screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildApplicationCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${stdInfo["personalInfo"]!["firstName"]}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Applied for Computer Science',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(width: 4),
                Text('Application Date: 2024-04-14'),
              ],
            ),
            const SizedBox(height: 8),
            const Column(
              children: [
                Icon(Icons.assignment),
                SizedBox(width: 4),
                Text('Documents: 3 submitted'),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
            
              onPressed: () {
                
                // Add functionality to view/edit application details
                
              },
              child: const Text('View Application'),
            ),
          ],
        ),
      ),
    );
  }
}
