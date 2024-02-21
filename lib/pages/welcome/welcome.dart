import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_state.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController=PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                        1,
                        context,
                        'next',
                        'First see learning',
                        'Forget about a for of paper all knowladge in one learning!',
                        'assets/images/reading.png'),
                    _page(
                        2,
                        context,
                        'next',
                        'Connect with everyone',
                        'Always keep in touch with your tutor & friend. let\'s get connected!',
                        'assets/images/boy.png'),
                    _page(
                        3,
                        context,
                        'get started',
                        'Always Fascinated Learning',
                        'Anywhere anytime. The time is at your discretion so study whenever you want!',
                        'assets/images/man.png'),
                  ],
                ),
                Positioned(
                    bottom: 60.h,
                    child: DotsIndicator(
                      mainAxisAlignment: MainAxisAlignment.center,
                      dotsCount: 3,
                      position: state.page,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThirdElementText,
                        activeColor: AppColors.primaryElement,
                        size: Size.square(8.0),
                        activeSize: Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ))
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(imagePath),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: (){
            if(index<3){
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            }else{
              // Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>MyHomePage(title: 'title')));
            Navigator.of(context).pushNamedAndRemoveUntil('/sign_in', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, right: 25.w, left: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(1, 2))
                ]),
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            )),
          ),
        )
      ],
    );
  }
}
