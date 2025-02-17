import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 50,
          leading: Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle
            ),
            child: Icon(Icons.list_sharp),
          ),
          title: Text("Chats",style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          actions: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.camera_alt),
            ),
            SizedBox(width: 10,),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.edit),
            ),
            SizedBox(width: 10,),

          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 20),
          child: Column(
            children: [
              TextFormField(
                cursorColor:Colors.blueAccent ,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                 hintText: "search",
                  // labelText: "search",
                  hintStyle: TextStyle(
                    color: Colors.grey
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none
                  ),


                ),
              ),
              // Column(
              //   children: [
              //     CircleAvatar(
              //       radius: 40,
              //     ),
              //     SizedBox(height: 5,),
              //     Text("ahmed"),
              //   ],
              // )
              SizedBox(height: 20,),
             SizedBox(
               height: 120,
               child: ListView.separated(
               scrollDirection: Axis.horizontal
               ,itemBuilder:(context,index)=>  Column(
                 children: [
                   CircleAvatar(
                     radius: 40,
                   ),
                   SizedBox(height: 5,),
                   Text("ahmed"),
                 ],
               ),
               itemCount: 10, separatorBuilder: (context, index) =>SizedBox(width: 10,),

               ),
             ),
              Expanded(
                child: ListView.separated(itemBuilder: (context,index)=>Row(children: [
                  CircleAvatar(radius: 40,),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start
                    ,children: [
                    Text("ahmed"),
                    Text("message, 11:20")
                  ],)
                ],), separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: 20),
              )

            ],
          ),
        ),
      ),
    );
  }
}
