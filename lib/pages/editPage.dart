import 'package:flutter/material.dart';
import 'package:socially/components/AppStrings.dart';
import 'package:socially/components/AppTextField.dart';
import 'package:socially/components/user_Avatar.dart';
import 'package:socially/pages/MainPage.dart';
import 'package:socially/styles/colors.dart';
import 'package:socially/styles/text.dart';

enum Gender{ none, male, female }

class EditPage extends StatefulWidget {
  const EditPage({ Key? key }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
                              child: UserAvatar(size: 120),
                            ),
                            Positioned(
                              bottom: 0,
                              right : 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(  
                                  color: MyColors.primary,
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Icon(Icons.edit,
                                size: 20,
                                color: Colors.black,
                                ))),          
                      ],),  

                      SizedBox(height: 60),
                      AppTextField(hintText: AppStrings.firstName  , secure: false, onChangeValue: (String value) {  }, ),
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
                            ),
                            ),
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
                                                Navigator.pushReplacement(
                                                   context,
                                                   MaterialPageRoute(builder: (context) => MainPage()));
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