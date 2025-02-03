



import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "My Profile",style: TextStyle(
          color:Colors.white,
        ),
        ),
        actions: [
          Icon(Icons.edit,color: Colors.white,)
        ],
        leading: Icon(Icons.list_sharp,color: Colors.white,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: Image.network("https://static.wikia.nocookie.net/hunterxhunter/images/7/73/HxH2011_EP24_Young_Killua_holding_an_apple.png",
              ).image,
            ),
            SizedBox(height: 40,),
            Text("Ahmed Abdelsattar",style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 20,),
            Text("Flutter Developer",style: TextStyle(
                color: Colors.grey,
              fontSize: 18
            ),),
            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/facebook.png",height: 30,width: 30,),
                SizedBox(width: 10,),
                Image.asset("assets/images/instagram.png",height: 30,width: 30,),
                SizedBox(width: 10,),
                Image.asset("assets/images/linkedin.png",height: 30,width: 30,),
                SizedBox(width: 10,),
                Image.asset("assets/images/whatsapp.png",height: 30,width: 30,),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade700,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Icon(Icons.email,color: Colors.white,),
                  SizedBox(width: 10,),
                  Text("ahmed@gmail.com",style: TextStyle(
                    color: Colors.white
                  ),)
                ],
              ),
            )

          ],
        ),
      )


    );
  }
}



