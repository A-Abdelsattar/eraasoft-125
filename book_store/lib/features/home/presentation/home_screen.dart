import 'package:book_store/book_store.dart';
import 'package:book_store/core/helpers/spacing.dart';
import 'package:book_store/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: [
            verticalSpace(100),
            NewArrivalseListView(),
            verticalSpace(100),
            BestSellerListView(),
          ],
        ),
      ),
    );
  }
}



class NewArrivalseListView extends StatelessWidget {
  const NewArrivalseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<HomeCubit,HomeState>(

      buildWhen: (prev,current)=>current is NewArrivalsSuccess||current is NewArrivalsError||current is NewArrivalsLoading
      ,builder: (context,state){
        if(state is NewArrivalsLoading){
          return Center(child: CircularProgressIndicator());
        }else if(state is NewArrivalsSuccess){
          return  ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>HomeBookItem(
                image: state.books[index].image??"",
              ),
              separatorBuilder: (context,index)=>horizontalSpace(10), itemCount: state.books.length);
        }else if(state is NewArrivalsError){
          return Text("Error");
        }else{
          return SizedBox.shrink();
        }
      }

         ),
    );
  }
}


class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<HomeCubit,HomeState>(
          buildWhen: (prev,current)=>current is BestSellerSuccess|| current is BestSellerError|| current is BestSellerLoading,
          builder: (context,state){
        if(state is BestSellerLoading){
          return Center(child: CircularProgressIndicator());
        }else if(state is BestSellerSuccess){
          return  ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>HomeBookItem(
                image: state.books[index].image??"",
              ),
              separatorBuilder: (context,index)=>horizontalSpace(10), itemCount: state.books.length);
        }else if(state is BestSellerError){
          return Text("Error");
        }else{
          return SizedBox.shrink();
        }
      }

      ),
    );
  }
}


class HomeBookItem extends StatelessWidget {
  final String image;
  const HomeBookItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        image: DecorationImage(
        fit: BoxFit.cover
        ,image: Image.network(image??"https://img.freepik.com/free-photo/high-angle-book-coffee-cup-arrangement_23-2149871524.jpg").image)
      ),
    );
  }
}
