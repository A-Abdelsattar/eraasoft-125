import 'package:book_store/book_store.dart';
import 'package:book_store/core/helpers/spacing.dart';
import 'package:book_store/core/theming/app_colors.dart';
import 'package:book_store/core/theming/app_text_style.dart';
import 'package:book_store/features/books/data/models/products_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookItem extends StatelessWidget {
  final Book? book;
  final void Function()? onTap;
  final void Function()? addToCartOnTap;
  const BookItem({super.key, required this.book, this.onTap, this.addToCartOnTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(

          border: Border.all(width: .5,color: Colors.grey.shade500)
        ),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(book?.image??"https://img.freepik.com/free-vector/book-with-lighbulb-cartoon-vector-icon-illustration-object-education-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-4009.jpg",
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.r),
                    margin: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.white
                    ),
                    child: Icon(Icons.favorite_border),
                  )
                ],
              ),
            ),
            verticalSpace(10),
            Text(book?.name??"",style: AppTextStyle.font12SemiBold,),
            Text(book?.category??"",style: AppTextStyle.font12SemiBold.copyWith(
              color: Colors.grey
            ),),
            Row(
              children: [
                Expanded(child: Text("${book?.price} \$")),
                InkWell(
                  onTap:addToCartOnTap ,
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    margin: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.mainColor
                    ),
                    child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
