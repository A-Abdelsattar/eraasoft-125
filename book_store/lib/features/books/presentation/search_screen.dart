import 'package:book_store/core/theming/app_colors.dart';
import 'package:book_store/features/books/cubit/book_cubit.dart';
import 'package:book_store/features/books/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _search=PublishSubject<String>();

  @override
  void initState() {
    _search.debounceTime(Duration(milliseconds: 300)).listen((v){
      context.read<BookCubit>().booksSearch(v??"");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          cursorColor: AppColors.mainColor,
          autofocus: true,
          onChanged: (v){
            _search.add(v);
          },
          decoration: InputDecoration(
            hintText: "Search",
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.mainColor
              ),


            ),

            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.mainColor
              ),


            )
          ),
        ),
      ),
      body: BlocBuilder<BookCubit, BookState>(
          buildWhen: (prev, current) => (current is SearchError ||
              current is SearchSuccess ||
              current is SearchLoading),
          builder: (context, state) {
            if (state is SearchLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SearchSuccess) {
              debugPrint(
                  "success state ${state.books.length.toString()}");
              return state.books.isEmpty
                  ? Text("not found")
                  : GridView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.w, vertical: 10.h),
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) => BookItem(
                  book: state.books[index],
                  onTap: () {},
                ),
                itemCount: state.books.length,
              );
            } else if (state is SearchError) {
              return Text(state.errorMessage);
            } else {
              return SizedBox.shrink();
            }
          })
    );
  }
}


