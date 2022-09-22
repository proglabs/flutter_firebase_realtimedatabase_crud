import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  final TextEditingController _edtNameController = TextEditingController();
  final TextEditingController _edtAgeController = TextEditingController();
  final TextEditingController _edtSubjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Directory"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        studentDialog();
      },child: const Icon(Icons.save),),
    );
  }

  void studentDialog() {
    showDialog(context: context, builder: (context){
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: _edtNameController, decoration: const InputDecoration(helperText: "Name"),),
              TextField(controller: _edtAgeController, decoration: const InputDecoration(helperText: "Age")),
              TextField(controller: _edtSubjectController, decoration: const InputDecoration(helperText: "Subject")),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                
                Map<String,dynamic> data = {
                  "name": _edtNameController.text.toString(),
                  "age": _edtAgeController.text.toString(),
                  "subject": _edtSubjectController.text.toString()
                };
                
                dbRef.child("Students").push().set(data).then((value){
                  Navigator.of(context).pop();
                });
                
              }, child: const Text("Save Data"))
            ],
          ),
        ),
      );
    });
  }
}
