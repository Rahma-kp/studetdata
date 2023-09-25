import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stud/db/functions/defunction.dart';
import 'package:stud/db/model/db_model.dart';
import 'package:stud/screen/addstudent.dart';
import 'package:stud/screen/editscreen.dart';
import 'package:stud/screen/search_page.dart';

class listStudent extends StatefulWidget {
  const listStudent({super.key});

  @override
  State<listStudent> createState() => _listStudentState();
}

class _listStudentState extends State<listStudent> {
  @override
  Widget build(BuildContext context) {
    getAllStud();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Student List"),
          automaticallyImplyLeading: false,
          actions: [IconButton(onPressed: (){
          // navigator to seach list....

          },
          icon: Icon(Icons.search))],
        ),
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: studenlistnotfier,
            builder: (BuildContext ctx, List<studentModel> studentlist,
                Widget? child) {
              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = studentlist[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: FileImage(File(data.image)),
                      ),
                      title: Text(
                        data.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,),
                      ),
                      subtitle: Text(
                        data.age,
                      ),
                      trailing: SingleChildScrollView(
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditScreen(
                                              index: index,
                                              name: data.name,
                                              age: data.age,
                                              course: data.coures,
                                              phoneNumber: data.numb,
                                              image: data.image,
                                            )));
                              },
                              icon: Icon(Icons.edit),
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            IconButton(
                              onPressed: () {
                                deletestud(index);
                              },
                              icon: Icon(Icons.delete_rounded),
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider();
                },
                itemCount: studentlist.length,
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addstuds(),
                  ));
            },
            icon: Icon(Icons.add),
            label: Text("add student")),
        backgroundColor: const Color.fromARGB(255, 148, 148, 148),
      ),
    );
  }
}
