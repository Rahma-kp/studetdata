import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stud/db/functions/defunction.dart';
import 'package:stud/db/model/db_model.dart';
import 'package:stud/screen/liststudent.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatefulWidget {
  final int? index;
  final String name;
  final String age;
  final String course;
  final String phoneNumber;
  final dynamic image;

  const EditScreen({super.key, 
    required this.name,
    required this.age,
    required this.course,
    required this.phoneNumber,
    required this.image,
    required this.index,

  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  File? selectimage;
  @override
  void initState() {
   
    _nameController.text = widget.name;
    _ageController.text = widget.age;
    _courseController.text = widget.course;
    _phoneNumberController.text = widget.phoneNumber;
       selectimage = widget.image != null ? File(widget.image) : null;
        super.initState();
  }

  Future<void> updateStudent(int index) async {
    final studentDb = await Hive.openBox<studentModel>("student_db");

    if (index >= 0 && index < studentDb.length) {
      final updatedStudent = studentModel(
        name: _nameController.text,
        age: _ageController.text,
        coures: _courseController.text,
        numb: _phoneNumberController.text,
        image: selectimage,
      );

      await studentDb.putAt(index, updatedStudent);
      getAllStud();

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const listStudent(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black
                ,radius: 60,
                 backgroundImage: selectimage != null
                                ? FileImage(selectimage!)
                                : AssetImage("assets/images/profile.png")
                                    as ImageProvider),
              SizedBox(height: 20,),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
                SizedBox(height: 10,),
              TextFormField(
                controller: _ageController,
                decoration:  InputDecoration(
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "Age",
                  prefixIcon: Icon(Icons.calendar_month),
                ),
              ),
               SizedBox(height: 10,),
               TextFormField(
                controller: _courseController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "course",
                  prefixIcon: Icon(Icons.book),
                ),
              ),
               SizedBox(height: 10,),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "phone",
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await updateStudent(widget.index!);
                },
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  fromgallery() async {
    final returnedimage =
        await ImagePicker().pickImage(source:ImageSource.gallery);

    setState(() {
      selectimage = File(returnedimage!.path);
    });
  }
  fromcam() async {
    final returnedimage =
        await ImagePicker().pickImage(source:ImageSource .camera);
    setState(() {
      selectimage = File(returnedimage!.path);
    });
  }

}