import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stud/db/functions/defunction.dart';
import 'package:stud/db/model/db_model.dart';
import 'package:stud/screen/addstudent.dart';
import 'package:stud/screen/editscreen.dart';
import 'package:stud/screen/search_page.dart';

class listStudent extends StatelessWidget {
  const listStudent({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStud();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Student List"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()async{},
           icon:Icon(Icons.search))
        ],
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
                      backgroundColor: Colors.black12,
                      backgroundImage: data.image != null
                        ? FileImage(File(data.image))
                        : null,
                    child: data.image == null
                        ? Icon(Icons.image, size: 40)
                        : null,
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
                                             index: data.index,
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
    );
  }
}
