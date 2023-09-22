
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stud/db/functions/defunction.dart';
import 'package:stud/db/model/dbmodel.dart';
import 'package:stud/screen/liststudent.dart';

class editscreen extends StatefulWidget {
   editscreen({required this.name,required this.age,required this.coures,required this.dateob,required this.numb,required this.email,required this.index});
  final String name;
  final String age;
  final String coures;
  final String dateob;
  final String  numb;
  final String email;
   final int index;

  @override
  State<editscreen> createState() => _editscreenState();
}

class _editscreenState extends State<editscreen> {
    
   final TextEditingController _namecontroller=TextEditingController();
   final TextEditingController _agecontroller=TextEditingController();
   final TextEditingController _coursecontroller=TextEditingController();
   final TextEditingController _dbcontroller=TextEditingController();
   final TextEditingController _emailcontroller=TextEditingController();
   final TextEditingController _numbercontroller=TextEditingController();

   @override
  void initState() {
    _namecontroller.text=widget.name;
    _agecontroller.text=widget.age;
    _coursecontroller.text=widget.coures;
    _dbcontroller.text=widget.dateob;
    _emailcontroller.text=widget.email;
    _numbercontroller.text=widget.numb;
    super.initState();
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _agecontroller.dispose();
    _coursecontroller.dispose();
    _dbcontroller.dispose();
    _emailcontroller.dispose();
    _numbercontroller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller:_namecontroller ,
                    decoration: InputDecoration(
                    labelText: "name",
                    hintText: widget.name,
                    prefixIcon:Icon(Icons.person),
                    )
                    ),
                  TextFormField(
                    controller: _agecontroller,
                    decoration: InputDecoration(
                    labelText: "age",
                    hintText: widget.age,
                    prefixIcon:Icon(Icons.calendar_month_outlined),
                    )
                    ),
                  TextFormField(
                    controller: _coursecontroller,
                    decoration: InputDecoration(
                    labelText: "coures",
                    hintText: widget.coures,
                    prefixIcon:Icon(Icons.book),
                    )
                    ),
                  TextFormField(
                    controller: _dbcontroller,
                    decoration: InputDecoration(
                    labelText: "date of birth",
                    hintText: widget.dateob,
                    prefixIcon:Icon(Icons.calendar_view_month_outlined),
                  )
                  ),
                  TextFormField(
                    controller:_emailcontroller ,
                    decoration: InputDecoration(
                    labelText: "email",
                    hintText: widget.email,
                    prefixIcon:Icon(Icons.email_outlined),
                    )
                    ),
                  TextFormField(
                    controller:_numbercontroller ,
                    decoration: InputDecoration(
                    labelText: "phone",
                    hintText: widget.numb ,
                    prefixIcon:Icon(Icons.phone),
                    ),
                  ),
                  SizedBox(height: 20,),
                  FloatingActionButton.extended(onPressed: (){
                    final value=studentModel(
                      name: _namecontroller.text,
                      coures: _coursecontroller.text,
                      age: _agecontroller.text,
                      dateob: _dbcontroller.text,
                      email:_emailcontroller.text,
                      numb: _numbercontroller.text);
                      Hive.box("student_db").putAt( widget.index, value);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => listStudent()));
                  }, label:Text("Update")),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
  Future <void>  UpdateAll() async{
   final na=_namecontroller.text.trim();
   final cr=_coursecontroller.text.trim();
   final ag=_agecontroller.text.trim();
   final em=_emailcontroller.text.trim();
   final db=_dbcontroller.text.trim();
   final nu=_numbercontroller.text.trim();
   if(na.isEmpty||cr.isEmpty||ag.isEmpty||em.isEmpty||db.isEmpty||nu.isEmpty){
    return;
   }else{
    final updatee=studentModel(name: na, coures: cr, age: ag, dateob: db, email: em, numb: nu);
   }
  }
}