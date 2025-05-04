import 'package:book_store/book_store.dart';
import 'package:book_store/core/theming/app_colors.dart';
import 'package:book_store/core/widgets/custom_app_bar.dart';
import 'package:book_store/features/books/cubit/book_cubit.dart';
import 'package:book_store/features/books/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       CustomAppBar(title: "Books",),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Min Price"),
        Text("Max Price"),
      ],),
      BlocBuilder<BookCubit, BookState>(
        buildWhen: (prev,current)=>current is ChangeSliderValue,
  builder: (context, state) {
    var cubit=context.read<BookCubit>();
    return Row(
      children: [
        Expanded(
          child: SliderTheme(
            data: const SliderThemeData(
                showValueIndicator: ShowValueIndicator.always),
            child: RangeSlider(
              labels:RangeLabels(cubit.startValue.toStringAsFixed(2), cubit.endValue.toStringAsFixed(2)) ,
              activeColor: AppColors.mainColor,
              min: 10,
              max: 1000
              ,values: RangeValues(cubit.startValue, cubit.endValue), onChanged:(value){
                cubit.changeValues(value);
              } ),
          ),
        ),
        
        ElevatedButton(onPressed: (){
          cubit.booksFilter();
        }, child: Text("Filter"))
      ],
    );
  },
),
      Expanded(
        child: BlocBuilder<BookCubit,BookState>(

            buildWhen: (prev,current)=>(current is GetBooksSuccess|| current is GetBooksLoading||current is GetBooksError),

            builder: (context,state){
          if(state is GetBooksLoading){
            return Center(child: CircularProgressIndicator());
          }
         else if(state is GetBooksSuccess){
           debugPrint("success state ${state.books.length.toString()}");
           return state.books.isEmpty? Text("not found"):GridView.builder(
             padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio: .7,
                 crossAxisSpacing: 16,
                 mainAxisSpacing: 16
             ),
             itemBuilder: (context,index)=>BookItem(
               book: state.books[index],
               onTap: (){
               },
             ),itemCount: state.books.length,
           );
         }else if(state is GetBooksError){
           return Text(state.errorMessage);
          }else{
           return SizedBox.shrink();
          }
        })
      ),

     ],
    );
  }
}


