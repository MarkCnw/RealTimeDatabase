import 'package:flutter/material.dart';
import 'package:realtime_database/RealTimeData/realtime_crud.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController snController = TextEditingController();
final TextEditingController addressController = TextEditingController();
void createButtonsheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Create your items",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Eg.elon",
                ),
              ),
              TextField(
                controller: snController,
                decoration: InputDecoration(
                  labelText: "S.N",
                  hintText: "eg.1",
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Address",
                  hintText: "eg.UK",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    final id = DateTime.now().microsecond.toString();
                    databaseReference.child(DateTime.now().millisecondsSinceEpoch.toString()).set({'name': nameController.text, 'sn': snController.text, 'address': addressController.text});
                  },
                  child: Text("add"))
            ],
          ),
        );
      });
}
