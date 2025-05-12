import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_store/core/theming/app_colors.dart';
import 'package:book_store/core/widgets/custom_app_bar.dart';
import 'package:book_store/features/books/cubit/book_cubit.dart';
import 'package:book_store/features/books/presentation/search_screen.dart';
import 'package:book_store/features/books/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
  builder: (context, state) {
    return Column(
      children: [
        CustomAppBar(
          title: "Books",
          withBackButton:false,
          actions: [
            IconButton(
                onPressed: () {
                  // showSearch(context: context, delegate:Delegate() );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                                value: BookCubit(),
                                child: SearchScreen(),
                              )));
                  // Navigator.pushNamed(context, "/booksSearch" );
                },
                icon: Icon(Icons.search))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Min Price"),
            Text("Max Price"),
          ],
        ),
        BlocBuilder<BookCubit, BookState>(
          buildWhen: (prev, current) => current is ChangeSliderValue,
          builder: (context, state) {
            var cubit = context.read<BookCubit>();
            return Row(
              children: [
                Expanded(
                  child: SliderTheme(
                    data: const SliderThemeData(
                        showValueIndicator: ShowValueIndicator.always),
                    child: RangeSlider(
                        labels: RangeLabels(cubit.startValue.toStringAsFixed(2),
                            cubit.endValue.toStringAsFixed(2)),
                        activeColor: AppColors.mainColor,
                        min: 10,
                        max: 1000,
                        values: RangeValues(cubit.startValue, cubit.endValue),
                        onChanged: (value) {
                          cubit.changeValues(value);
                        }),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      cubit.booksFilter();
                    },
                    child: Text("Filter"))
              ],
            );
          },
        ),
        Expanded(
            child: BlocConsumer<BookCubit, BookState>(
              listenWhen: (prev,current)=>current is AddToCartSuccess,
              listener: (context,state){
                if(state is AddToCartSuccess){
                  print("Heeeeeeeel");
                  // Fluttertoast.showToast(
                  //     msg: "This is Center Short Toast",
                  //     toastLength: Toast.LENGTH_LONG,
                  //
                  //     gravity: ToastGravity.TOP,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.green,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0
                  // );

               showDialog(context: context, builder: (context)=>AlertDialog(
                 title: Text(state.message),

               ));
                }
              },
                buildWhen: (prev, current) => (current is GetBooksSuccess ||
                    current is GetBooksLoading ||
                    current is GetBooksError),
                builder: (context, state) {
                  if (state is GetBooksLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is GetBooksSuccess) {
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
                              addToCartOnTap: (){
                                context.read<BookCubit>().addToCart(productId: state.books[index].id!);
                              },
                              book: state.books[index],
                              onTap: () {},
                            ),
                            itemCount: state.books.length,
                          );
                  } else if (state is GetBooksError) {
                    return Text(state.errorMessage);
                  } else {
                    return SizedBox.shrink();
                  }
                })),
      ],
    );
  },
);
  }
}



class Delegate extends SearchDelegate {
  // Sample data
  final List<String> data = [
    "Apple",
    "Banana",
    "Orange",
    "Watermelon",
    "Mango",
    "Pineapple",
  ];

  // Filtered results based on query
  List<String> get filteredData => data
      .where((item) => item.toLowerCase().contains(query.toLowerCase()))
      .toList();

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Clear button
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Back button
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Shown when user submits the query
    final results = filteredData;
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () => close(context, results[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Live suggestions while typing
    final suggestions = filteredData;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
