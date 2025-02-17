import 'package:flutter/material.dart';
import 'package:untitled1/screens/home/home_screen.dart';
import 'package:untitled1/screens/messenger/messenger_screen.dart';
import 'package:untitled1/screens/settings/settings_screen.dart';



class BottomNavBarScreen extends StatefulWidget {
   const BottomNavBarScreen({super.key, });

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex=0;

  Widget currentScreen(){
    switch(currentIndex){
      case 0:
        return HomeScreen();
      case 1:
        return MessengerScreen();
      case 2:
      case 3:
        return SettingsScreen();
      default:
        return SizedBox();
    }
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild build");
    return Scaffold(
      bottomNavigationBar:
      BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
       unselectedItemColor: Colors.black,
      selectedItemColor: Colors.blue,
      currentIndex: currentIndex,
      onTap: (index){
       setState(() {
         currentIndex=index;
       });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.chat),label: "chats"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings"),
      ]),
      body: currentScreen(),
    );
  }
}
