
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stud/db/functions/defunction.dart';
import 'package:stud/db/model/dbmodel.dart';
import 'package:stud/screen/liststudent.dart';



class addstuds extends StatelessWidget {
  addstuds({super.key});

  final _namecontroller=TextEditingController();
  final _corsecontroller=TextEditingController();
  final _agecontroller=TextEditingController();
  final _dbcontroller=TextEditingController();
  final _emailcontroller=TextEditingController();
  final _numbercontroller=TextEditingController();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType:TextInputType.text ,
                inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z\s]'))],
                controller:_namecontroller ,
                decoration:InputDecoration(
                icon:Icon(Icons.person) ,
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
              TextFormField(
                controller:_corsecontroller ,
                decoration:InputDecoration(
                labelText: "coures",
                hintText: "Enter your coures",
                prefixIcon: Icon(Icons.abc)
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
              TextFormField(
                keyboardType: TextInputType.phone,
                inputFormatters:[FilteringTextInputFormatter.digitsOnly ],
                controller: _agecontroller,
                decoration:InputDecoration(
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
              TextFormField(
                controller: _dbcontroller,
                decoration:InputDecoration(
                labelText: "Date of Birth",
                hintText:"MM/DD/YYYY",
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
             TextFormField(
               keyboardType: TextInputType.emailAddress,
              //  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))],
               controller:_emailcontroller ,
               decoration:InputDecoration(
               labelText: "Email",
               hintText: "Enter your email address",
               prefixIcon: Icon(Icons.email_outlined),
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
              TextFormField(
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
               controller:_numbercontroller,
               decoration:InputDecoration(
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
    );
  }
  Future<void> onAddStudentOnClick()async{
    final _name=_namecontroller.text.trim();
    final _age=_agecontroller.text.trim();
    final _db=_dbcontroller.text.trim();
    final _class=_corsecontroller.text.trim(); 
    final _email=_emailcontroller.text.trim();
    final _numb=_numbercontroller.text.trim();
    if(_name.isEmpty||_age.isEmpty||_db.isEmpty||_class.isEmpty||_email.isEmpty){
      return;
    }

   final _student= studentModel(name: _name,coures: _class,age: _age,dateob: _db,email: _email,numb:_numb );
    
    addstud(_student);
  }
}