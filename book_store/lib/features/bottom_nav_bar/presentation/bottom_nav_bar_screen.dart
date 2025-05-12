import 'package:book_store/core/helpers/spacing.dart';
import 'package:book_store/core/theming/app_colors.dart';
import 'package:book_store/features/books/cubit/book_cubit.dart';
import 'package:book_store/features/books/presentation/books_screen.dart';
import 'package:book_store/features/home/cubit/home_cubit.dart';
import 'package:book_store/features/home/presentation/home_screen.dart';
import 'package:book_store/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;
  List<Widget> _screens = [
    BlocProvider(create: (context)=>HomeCubit()..getNewArrivalsList()..getBestSellerList(),
      child: HomeScreen(),

    ),
    BlocProvider(
      create: (context) => BookCubit()..getBooks(),
      child: BooksScreen(),
    ),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (_currentIndex != 2) {
          setState(() {
            _currentIndex = 2;
          });
        }
      },
        shape: CircleBorder(),
        backgroundColor: Colors.white,
        child: Icon(Icons.search,
          color: _currentIndex == 2 ? AppColors.mainColor : Colors.black,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 12,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavBarIcon(
              isActive: _currentIndex == 0
              , label: "Home", icon: Icons.home,
              onTap: () {
                if (_currentIndex != 0) {
                  setState(() {
                    _currentIndex = 0;
                  });
                }
              },
            ),
            BottomNavBarIcon(
              isActive: _currentIndex == 1,
              onTap: () {
                if (_currentIndex != 1) {
                  setState(() {
                    _currentIndex = 1;
                  });
                }
              }
              , label: "Books", icon: Icons.book,),
            SizedBox(),
            BottomNavBarIcon(
              isActive: _currentIndex == 3
              , onTap: () {
              if (_currentIndex != 3) {
                setState(() {
                  _currentIndex = 3;
                });
              }
            }, label: "MyCart", icon: Icons.add_shopping_cart,),
            BottomNavBarIcon(
              isActive: _currentIndex == 4,
              onTap: () {
                if (_currentIndex != 4) {
                  setState(() {
                    _currentIndex = 4;
                  });
                }
              }
              , label: "Profile", icon: Icons.person,),
          ],
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}

class BottomNavBarIcon extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool isActive;
  final void Function()? onTap;

  const BottomNavBarIcon(
      {super.key, this.icon, required this.label, this.onTap, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: isActive ? AppColors.mainColor : Colors.black,),
          verticalSpace(5),
          Text(label, style: TextStyle(
              color: isActive ? AppColors.mainColor : Colors.black
          ),)

        ],
      ),
    );
  }
}

