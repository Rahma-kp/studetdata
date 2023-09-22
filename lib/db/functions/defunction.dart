import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:stud/db/model/dbmodel.dart';
import 'package:stud/screen/liststudent.dart';

ValueNotifier<List<studentModel>>studenlistnotfier =ValueNotifier([]);



Future <void> addstud(studentModel value)async
{
  final studentDb = await Hive.openBox<studentModel>("student_db");
    await studentDb.add(value);
    getAllStud();
}

Future<void> getAllStud()async{
   final studentDb= await Hive.openBox<studentModel>("student_db");
  studenlistnotfier.value.clear();
  studenlistnotfier.value.addAll(studentDb.values);
  studenlistnotfier.notifyListeners(); 
}

Future<void> deletestud(int index)async{
  final studentDb= await Hive.openBox<studentModel>("student_db"); 
   await studentDb.deleteAt(index);
  getAllStud();
}

// Future<void> update(int _id)async{
//   final studentDb= await Hive.openBox<studentModel>("student_db");
//   Hive.box(s)
// }