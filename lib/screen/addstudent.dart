
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stud/db/functions/defunction.dart';
import 'package:stud/db/model/db_model.dart';
import 'package:stud/screen/liststudent.dart';
import 'package:image_picker/image_picker.dart';



class addstuds extends StatefulWidget {
  addstuds({super.key});

  @override
  State<addstuds> createState() => _addstudsState();
}

class _addstudsState extends State<addstuds> {
  final _namecontroller=TextEditingController();

  final _corsecontroller=TextEditingController();

  final _agecontroller=TextEditingController();

  final _numbercontroller=TextEditingController();

  final ImagePicker imagePicker=ImagePicker();

  File? pickImage;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body:  Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.black,
                  child:pickImage==null? Icon(Icons.add_a_photo):ClipOval(
                    child: Image.file(pickImage!,fit: BoxFit.cover,)
                  ),),
                   SizedBox(height: 20,),
          
                TextFormField(
                  keyboardType:TextInputType.text ,
                  inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z\s]'))],
                  controller:_namecontroller ,
                  decoration:InputDecoration(
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "Name",
                  hintText: "Enter your Name",
                  prefixIcon: Icon(Icons.person),
                ),
                 validator: (value){
                          if(value==null || value.isEmpty){
                            return 'value is empty';
                          }else{
                            return null;
                          }
                        
                },
                ),
                 SizedBox(height: 10,),
                TextFormField(
                  controller:_corsecontroller ,
                  decoration:InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "coures",
                  hintText: "Enter your coures",
                  prefixIcon: Icon(Icons.book)
                ),
                validator: (value){
                  if(value==null ||value.isEmpty){
                    return 'value is empty';
                  }
                  else{
                    return null;
                  }
                }
                ),
                 SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters:[FilteringTextInputFormatter.digitsOnly ],
                  controller: _agecontroller,
                  decoration:InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: "Age",
                  hintText: "Enter your Age",
                  prefixIcon: Icon(Icons.calendar_month_outlined),
                ),
                maxLength: 3,
                validator: (value){
                  if(value==null ||value.isEmpty){
                    return 'value is empty';
                  }
                  else{
                    return null;
                  }
                }
                ),
                 SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                 controller:_numbercontroller,
                 decoration:InputDecoration(
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                 labelText: "phone",
                 hintText: "enter your phone number",
                 prefixText: "+91",
                 prefixIcon:Icon(Icons.phone),
                ),
                maxLength: 10,
                validator: (value){
                  if(value==null ||value.isEmpty){
                    return 'value is empty';
                  }
                  else{
                    return null;
                  }
                }
                ),
                SizedBox(height: 20,),
                 ElevatedButton(onPressed: (){
                  if(_formkey.currentState!.validate()){
                      onAddStudentOnClick();
                   Navigator.push(context, MaterialPageRoute(builder: (context) => listStudent(),));
                  }
                 
                 }, child: Text("Add"))
            
              ] 
              ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentOnClick()async{
    final _name=_namecontroller.text.trim();
    final _age=_agecontroller.text.trim();
    final _courese=_corsecontroller.text.trim(); 
    final _numb=_numbercontroller.text.trim();
    if(_name.isEmpty||_age.isEmpty||_courese.isEmpty||_numb.isEmpty){
      return;
    }

   final _student= studentModel(name: _name,coures:_courese,age: _age,numb:_numb,image: pickImage?.path??'', );
    
    addstud(_student);
  }

   getimage(ImageSource source) async {
    var img = await imagePicker.pickImage(source: source);
    setState(() {
          pickImage = File(img!.path);
    });

  }
}