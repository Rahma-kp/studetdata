// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:studentlist/db/functions/db_functions.dart';
// import 'package:studentlist/list_student_widget.dart';
// import 'package:studentlist/model/data_model.dart';
// import 'package:image_picker/image_picker.dart';

// class updatedetais extends StatefulWidget {
//   int index;
//   var name;
//   var age;
//   var phone;
//   var address;
//   dynamic image;


//   updatedetais({super.key,
//   required this.index,
//   required this.name,
//   required this.age,
//   required this.phone,
//   required this.address,
//   required this.image}
//   );

//   @override
//   State<updatedetais> createState() => _updatedetaisState();
// }

// class _updatedetaisState extends State<updatedetais> {
//   File?_file;

//   final a=const SizedBox(
//     height: 30,
//   );

// TextEditingController _studentname=TextEditingController();
// TextEditingController _studentage =TextEditingController();
// TextEditingController _studentphone=TextEditingController();
// TextEditingController _studentaddress=TextEditingController();
// String profilePhoto='';



//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _studentname=TextEditingController(text:widget.name);
//     _studentage=TextEditingController(text: widget.age);
//     _studentphone=TextEditingController(text: widget.phone);
//     _studentaddress=TextEditingController(text: widget.address);
//     profilePhoto=widget.image;
//   }



//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: Text('UPDATE DETAILS'),),
//           body: ListView(
//             children: [
//               SizedBox(height: 20,),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(50)
//                 ),
//                 child: IconButton(onPressed: (){getcam();}, icon:Icon(Icons.camera_alt_outlined)),
//               ),
//               SizedBox(height: 20,),
//               Container(
//                 child: _file!=null
//                 ?CircleAvatar(
//                   radius: 80,
//                   child: SizedBox(
//                     width: 150,
//                     child: ClipRRect(borderRadius:BorderRadius.circular(110),
//                     child: Image.file(
//                       _file!,
//                       fit: BoxFit.cover,
//                     ),),
                    
//                   ),

//                 )
//                 :CircleAvatar(
//                  backgroundImage: widget.image is File ? FileImage(widget.image) : FileImage(File(widget.image)),

//                   radius: 80,
//                 )
//               ),
//               SizedBox(height: 20,),

//               Container(
//                 decoration: BoxDecoration(
//                   color:Colors.blue,
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 child: IconButton(onPressed: (){getimage();}, icon: Icon(Icons.photo_sharp)),
//               ),
//               SizedBox(height: 20,),
//               TextFormField(
//                 controller:_studentname,
//                  decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'name',)
//               ),
//               SizedBox(height: 10,),
//                TextFormField(
//                 controller: _studentage,
//                  decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'age',)
//               ),
//                SizedBox(height: 10,),
//                TextFormField(
//                 controller: _studentphone,
//                  decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'phone',)
//               ),
//                SizedBox(height: 10,),
//                TextFormField(
//                 controller:_studentaddress,
//                  decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Address',)
//               ),
//                SizedBox(height: 10,),
//                  ElevatedButton.icon(onPressed: (){upadteall();}, icon: const Icon(Icons.flag), label:const Text('UPDATE'),
//                   ), 
//             ],
//           ),
//         )
//         ,);
        
      

//   }


//   Future<void>upadteall()async{
//   final st_name=_studentname.text.trim();
//   final st_age=_studentage.text.trim();
//   final st_phone=_studentphone.text.trim();
//   final st_address=_studentaddress.text.trim();

//   if(st_name.isEmpty||st_age.isEmpty||st_phone.isEmpty||st_address.isEmpty||profilePhoto.isEmpty){
//     return;
//   }else{
//     final updation =StudetModel(name: st_name, age:st_age, phone:st_phone, address: st_address,i_mage:profilePhoto);
//     update(widget.index, updation);
//     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ListStudentWidget()));

//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(behavior: SnackBarBehavior.floating,
//     backgroundColor: Colors.green,
//     content: Text('UPDATED'),));
//   }
// }
// getimage()async{
//   final XFile?_wantimage=await ImagePicker().pickImage(source: ImageSource.gallery);

//   if(_wantimage!=null){
//     setState(() {
//       _file =File(_wantimage.path);
//       profilePhoto=_wantimage.path;
//     });
//   }
// }

// getcam()async{
//   final XFile?_wantimage=await ImagePicker().pickImage(source: ImageSource.camera);

//   if(_wantimage!=null){
//     setState(() {
//       _file =File(_wantimage.path);
//       profilePhoto=_wantimage.path;
//     });
//   }
// }
// }