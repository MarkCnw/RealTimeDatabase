import 'package:flutter/material.dart';
import 'package:realtime_database/RealTimeData/create_buttom.dart';
import 'package:firebase_database/firebase_database.dart';

class RealTimeCruddatabase extends StatefulWidget {
  const RealTimeCruddatabase({super.key});

  @override
  State<RealTimeCruddatabase> createState() => _RealTimeCruddatabaseState();
}
final databaseReference = FirebaseDatabase.instance.ref();
class _RealTimeCruddatabaseState extends State<RealTimeCruddatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Realtime Database'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createButtonsheet(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
