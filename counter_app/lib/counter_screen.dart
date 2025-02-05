

import 'package:counter_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
    CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CounterScreenBody(),
    );
  }
}

class CounterScreenBody extends StatefulWidget {
  const CounterScreenBody({super.key});

  @override
  State<CounterScreenBody> createState() => _CounterScreenBodyState();
}

class _CounterScreenBodyState extends State<CounterScreenBody> {
  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient:LinearGradient(colors: [
            Colors.blue,
            Colors.white
          ], begin:Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
      child: Column(
        children: [
          Image.asset("assets/images/logo.png",height: 300,),
          Text("Let's count And Have Fun! 🔄️",style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20,),
          Divider(color: Colors.black,
            thickness: 2,
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30,
                vertical: 20
            ),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.5),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text("Counter: $counter",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green
            ),),
          ),
          SizedBox(height: 20),
          CustomButton(
            title: "Increment",
            color: Colors.green,
            onPressed: (){
              setState(() {
                counter--;
              });
            },
          ),
          SizedBox(height: 10,),
          CustomButton(
            title: "Decrement",
            color: Colors.deepOrangeAccent,
            onPressed: (){
              if(counter>0){
                setState(() {
                  counter--;
                });
              }
            },
          ),
          SizedBox(height: 10,),
          CustomButton(
              title: "Reset",
              color: Colors.red,
              onPressed: (){
                if(counter!=0){
                  setState(() {
                    counter = 0;
                  });
                }
              }
          ),

        ],
      ),
    );
  }
}
