import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/app_text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';


class ProfileScreen extends StatefulWidget {
   ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker picker = ImagePicker();

   XFile? image;
   pickFromCamera()async{
     image= await picker.pickImage(source: ImageSource.camera);

   }
 pickFromGallery()async{
     image=  await picker.pickVideo(source: ImageSource.gallery);;

   }
   bool switchValue=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(
        color: AppColors.primaryColor
      ),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                context: context, builder: (context)=>Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 16),
                      child: Column(
                        children: [
                        CustomButton(title: "Upload from Camera",onTap: ()async{
                        await  pickFromCamera();
                        Navigator.pop(context);
                          setState(() {

                          });
                        },),
                        SizedBox(height: 10,),
                        CustomButton(title: "Upload from Gallery",
                        onTap: ()async{
                          await pickFromGallery();
                          Navigator.pop(context);
                          setState(() {
                            
                          });
                        },
                        ),

                        ],
                      ),
                    ),
                  ],
                ));
              },
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor,width: 5),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover
                            ,image: Image.file(File(image?.path??"")).image)
                    ),

                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                    ),
                      child: Icon(Icons.camera_alt,color: Colors.white,)),

                ],
              ),
            ),
            SizedBox(height: 30,),
            Divider(
              color: AppColors.primaryColor,
              thickness: 2,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(height: 30,),
            Row(children: [
              Expanded(child: Text("data",style: AppTextStyle.fontStyle20Bold,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit))
            ],)
          ],
        ),
      ),
    );
  }
}
