

import 'package:flutter/material.dart';
import 'package:stud/db/functions/defunction.dart';
import 'package:stud/db/model/dbmodel.dart';
import 'package:stud/screen/addstudent.dart';
import 'package:stud/screen/editscreen.dart';

class listStudent extends StatelessWidget {
  const listStudent({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStud();
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: studenlistnotfier,
          builder:
          (BuildContext ctx, List<studentModel> studentlist, Widget? child){
              
              return  ListView.separated(
            itemBuilder:(ctx ,index){
              final data=studentlist[index];  
              return ListTile(
                leading:IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>editscreen(
                    index: index,
                    name:data.name ,
                    age:data.age ,
                    coures:data.coures , 
                    dateob:data.dateob ,
                    email: data.email,
                    numb:data.numb ,
                  )));
                }, icon:Icon(Icons.edit)),
                title: Text(data.name),
                subtitle:Text(data.age),
                trailing:IconButton(onPressed: (){
                  deletestud(index);
  
                }, icon:Icon(Icons.delete_rounded))
                
              );
            },
            separatorBuilder: (ctx,index){
              return const Divider();
            },
            itemCount:studentlist.length ,
          );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) =>addstuds() , ));
      },
      icon: Icon(Icons.add), label:Text("add student")),
    );
  }
} 