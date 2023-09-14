import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socially/components/AppStrings.dart';
import 'package:socially/components/AppTextField.dart';
import 'package:socially/components/loginsignuptextfield.dart';
import 'package:socially/models/UserModel.dart';
import 'package:socially/styles/colors.dart';
import 'package:socially/styles/text.dart';

enum Gender{ none, male, female }

class EditPage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;

  const EditPage({super.key,required this.userModel,required this.firebaseUser});
  

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  File? imageFile;
  TextEditingController fullNameController = TextEditingController();


  void selectImage(ImageSource source) async { 
    XFile? pickedFile = await
     ImagePicker().pickImage(source: source);

     if(pickedFile!=null){
       cropImage(pickedFile);
     }
  }
  void cropImage(XFile file) async {
    final ImageCropper imageCropper = ImageCropper();
    CroppedFile? croppedFile = await imageCropper.cropImage(
      sourcePath: file.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 20,
    );
    if (croppedFile != null) {
      setState(() {
        imageFile = File(croppedFile.path);
      });
    }
  }

  void showPhotoOptions(){
    showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text(AppStrings.takePhoto),
                onTap: (){
                  Navigator.pop(context);
                  selectImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text(AppStrings.chooseFromGallery),
                onTap: (){
                  Navigator.pop(context);
                  selectImage(ImageSource.gallery);
                },
              ),
            ],
          ), 
        );
      }
    );
  }

  void CheckValues(){ 
    String fullName = fullNameController.text.trim();
    if(fullName == "" || imageFile == null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("pleaseFillAllFields"),
        ),
      );
    }
    else{
      log("uploading data..");
        uploadData();

    } 
  }
  

  void uploadData() async {
    try{

    String? fullname = fullNameController.text.trim();
    widget.userModel.fullName = fullname;


    await FirebaseFirestore.instance.collection
    ("user")
    .doc(widget.userModel.uid)
    .set(widget.userModel.toMap()).then((value){
      print("data uploaded");
    }
    );
    }catch(e){
      print(e.toString());
    }
  }

  var gender = Gender.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
     backgroundColor: MyColors.backgroundColor,
     appBar: AppBar(
     backgroundColor: MyColors.backgroundColor,
     centerTitle: true,
     automaticallyImplyLeading: false,
     title: Text(AppStrings.editProfile),
     ),
     body: SingleChildScrollView(
      child: Padding(
       padding: const EdgeInsets.all(24.0),
       child: Column(  
       children: [  
       Stack(
       children: [  
       Padding(
       padding: const EdgeInsets.all(12.0),
       child: CupertinoButton(
        onPressed: (){
          showPhotoOptions();
        },
      child:CircleAvatar( 
        radius: 60,
        backgroundImage: (imageFile != null) ?
         FileImage(imageFile!): null,
        child: (imageFile == null) ?
        Icon(Icons.person, size: 60) : null,
      ) 
       ) 
       ),
       Positioned(
        bottom: 0,
        right : 10,
        child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(  
        color: MyColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      child: Icon(Icons.edit,
        size: 20,
        color: Colors.black,
         )
        )
      ),          
    ],
  ),  

     SizedBox(height: 60),
      LoginSignupText(
      hintText: AppStrings.firstName,
      controller: fullNameController,
      secure: false,
      ),
     SizedBox(height: 16,),
      AppTextField(hintText: AppStrings.lastName  , secure: false, onChangeValue: (String value) {  }, ),
     SizedBox(height: 16,),
      AppTextField(hintText: AppStrings.phoneNumber  , secure: false, onChangeValue: (String value) {  }, ),
     SizedBox(height: 16,),
      AppTextField(hintText: AppStrings.location  , secure: false, onChangeValue: (String value) {  }, ),
     SizedBox(height: 16,),
       AppTextField(hintText: AppStrings.birthday  , secure: false, onChangeValue: (String value) {  }, ),
     SizedBox(height: 16,),   
       Container(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
        decoration: BoxDecoration(
        color: MyColors.fieldColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
       ),
    child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         Text(AppStrings.gender,
         style: AppText.body1.copyWith(
         fontSize: 12,
         )),
         Row(  
        children: [
       Expanded(
        child: RadioListTile(
        title: Text(AppStrings.male),
        value: Gender.male,
      groupValue: gender,
        visualDensity:const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
         ),
        contentPadding: EdgeInsets.zero,
        onChanged: (value){
      setState((){
        gender = Gender.male;
       });
                }
              ),
                ),
      Expanded(
        child: RadioListTile(
          title: Text(AppStrings.female),
        value: Gender.female,
    groupValue: gender,
    visualDensity:const VisualDensity(
      horizontal: VisualDensity.minimumDensity,
      vertical: VisualDensity.minimumDensity,
    ),
    contentPadding: EdgeInsets.zero,
    onChanged: (value){
    setState((){
        gender = Gender.female;
        });
        }, ),
          ), 
        ],
        ),
        ], ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column( 
              children: [ 
            SizedBox(
                height: 45, width: 120,
              child: Expanded(
                child: ElevatedButton(
                  onPressed: () {
                  CheckValues();
                  }, 
                  child: Text(  
                  AppStrings.save,
                  style:  TextStyle( 
                  color:Colors.black ,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                
                  )
                  ),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
),                                  
              ),
              ),
            ),
              ],
            )
          ),
        ),     
      ],
      
      ),
      ),
      
        ),
      );
}
}