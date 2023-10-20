import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoapp/src/theme/app_color/app_color.dart';
import 'package:todoapp/src/theme/app_fonts/app_fonts.dart';
import 'package:todoapp/src/ui/auth/register/register_screen.dart';
import 'package:todoapp/src/ui/onboarding/onboarding_screen.dart';

class OnBoardingAnimateScreen extends StatefulWidget {
  const OnBoardingAnimateScreen({super.key});

  @override
  State<OnBoardingAnimateScreen> createState() =>
      _OnBoardingAnimateScreenState();
}

class _OnBoardingAnimateScreenState extends State<OnBoardingAnimateScreen> {
  PageController pageController = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 80.h),
            child: PageView(
              onPageChanged: (i){
                index = i;
                setState(() {

                });
              },
              controller: pageController,
              children: const [
                OnBoardingScreen(
                    img: 'assets/image/onboard1.png',
                    title: 'Manage your tasks',
                    body:
                        'You can easily manage all of your daily tasks in DoMe for free'),
                OnBoardingScreen(
                    img: 'assets/image/onboard2.png',
                    title: 'Create daily routine',
                    body:
                        'In Uptodo  you can create your personalized routine to stay productive'),
                OnBoardingScreen(
                    img: 'assets/image/onboard3.png',
                    title: 'Orgonaize your tasks',
                    body:
                        'You can organize your daily tasks by adding your tasks into separate categories'),
              ],
            ),
          ),
          Positioned(
            top: 400.h,
            left: MediaQuery.of(context).size.width / 2.9.w,
            child: SmoothPageIndicator(
                controller: pageController, // PageController
                count: 3,
                effect: const SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 29.28,
                    dotHeight: 4.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.grey), // your preferred effect
                onDotClicked: (index) {}),
          ),
          Positioned(
            bottom: 52.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        if (index == 2) {
                          setState(() {
                            index = 1;
                            pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            // _pageController.jumpToPage(1);
                          });
                        } else if (index == 1) {
                          setState(() {
                            index = 0;
                            pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            //_pageController.jumpToPage(2);
                          });
                        }
                      },
                      child: Text(
                        'BACK',
                        style: AppStyle.small(Colors.grey),
                      )),
                  GestureDetector(
                    onTap: () => nextPage(),
                    child: AnimatedContainer(
                      curve: Curves.linear,
                      alignment: Alignment.center,
                      width: index == 2 ? 150 : 90.w,
                      duration: const Duration(milliseconds: 600),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.purple),
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text(
                        index == 2 ? "GET STARTED" : "NEXT",maxLines: 1,
                        style: AppStyle.body(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  nextPage(){
    if (index == 0) {
      setState(() {
        index = 1;
        pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        // _pageController.jumpToPage(1);
      });
    } else if (index == 1) {
      setState(() {
        index = 2;
        pageController.animateToPage(
          2,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        //_pageController.jumpToPage(2);
      });
    } else if (index == 2) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
        return const RegisterScreen();
      },),);
    }
  }
}
