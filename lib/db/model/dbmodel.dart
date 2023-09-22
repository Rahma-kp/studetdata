import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'dbmodel.g.dart';

 @HiveType(typeId: 1)
 class  studentModel{
  
@HiveField(0)
   int? index;

  @HiveField(1)
  final String name;
  @HiveField(2)
  final String coures;
  @HiveField(3)
  final String age;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String dateob;
  @HiveField(6)
  final String numb;
  studentModel({required this.name,required this.coures,required this.age,required this.dateob,required this.email,required this.numb,this.index});
  
}