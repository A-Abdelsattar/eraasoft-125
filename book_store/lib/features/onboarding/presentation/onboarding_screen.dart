import 'package:book_store/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller=PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));

            }, child: Text("Skip")),
            SizedBox(height: 100,),
            Expanded(child: PageView(
              controller:controller ,
              children: [
               PageViewItem(),
               PageViewItem(),
               PageViewItem(),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                    controller: controller,
                    count:  3,
                    effect:  ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 12,

                    ),
                    onDotClicked: (index){
                    }
                ),
                InkWell(
                  onTap: (){
                   if(controller.page?.toInt()==2){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                   }else {
                     controller.nextPage(duration: Duration(milliseconds: 600),
                         curve: Curves.easeIn);
                   } },
                  child: CircleAvatar(
                    radius: 30,
                    child:Icon(Icons.arrow_forward),
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



class PageViewItem extends StatelessWidget {
  // final String image;
  // final String title;
  // final String subTitle;
  // const PageViewItem({super.key, required this.image, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network("https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg"),
        Text("data"),
        Text("data"),
      ],
    );
  }
}
