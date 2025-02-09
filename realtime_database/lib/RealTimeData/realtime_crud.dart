import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realtime_database/RealTimeData/create_bottom_sheet.dart';
import 'package:realtime_database/RealTimeData/update_bottom.dart';

class RealTimeCruddatabase extends StatefulWidget {
  const RealTimeCruddatabase({super.key});

  @override
  State<RealTimeCruddatabase> createState() => _RealTimeCruddatabaseState();
}

// final nameController = TextEditingController();
final databaseReference = FirebaseDatabase.instance.ref("StoreData");

class _RealTimeCruddatabaseState extends State<RealTimeCruddatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Realtime Database"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
                  query: databaseReference,
                  itemBuilder: (context, snapshot, index, animation) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(snapshot.child("name").value.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        subtitle: Text(snapshot.child("address").value.toString()),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue[100],
                          child: Text(snapshot.child("sn").value.toString())),
                        trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  updateBottomSheet(
                                    context,
                                    snapshot.child("name").value.toString(),
                                    snapshot.child("id").value.toString(),
                                    snapshot.child("sn").value.toString(),
                                    snapshot.child("address").value.toString(),
                                  );
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text("Edit"),
                              ),
                            ),
                            PopupMenuItem(
                                value: 2,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    databaseReference.child(snapshot.child('id').value.toString()).remove();
                                  },
                                  leading: const Icon(Icons.delete),
                                  title: const Text(
                                    "Delete",
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createBottomSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
