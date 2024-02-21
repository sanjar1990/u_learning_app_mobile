import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index=0;
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child:  SafeArea(
        child: Scaffold(
          body: buildPage(_index),
        bottomNavigationBar: Container(
          width: 375.w,
          height: 58.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r)
          ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1
              )
            ]
          ),
          child: BottomNavigationBar(
            onTap: (value){
              setState(() {
                _index=value;
              });
            },
            currentIndex: _index,
            elevation: 0,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourthElementText,
            items: [
              BottomNavigationBarItem(
                icon:  SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset('assets/icons/home.png', color: AppColors.primaryFourthElementText,),
              ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset('assets/icons/home.png', color: AppColors.primaryElement,),
                  ),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon:  SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/search2.png', color: AppColors.primaryFourthElementText,),
                ),
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/search2.png', color: AppColors.primaryElement,),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon:  SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/play-circle1.png', color: AppColors.primaryFourthElementText,),
                ),
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/play-circle1.png', color: AppColors.primaryElement,),
                ),
                label: 'Course',
              ),
              BottomNavigationBarItem(
                icon:  SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/message-circle.png', color: AppColors.primaryFourthElementText,),
                ),
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                 child: Image.asset('assets/icons/message-circle.png', color: AppColors.primaryElement,),
                ),
                label: 'chat',
              ),
              BottomNavigationBarItem(
                icon:  SizedBox(
                  width: 15.w,
                  height: 15.h,

                  child: Image.asset('assets/icons/person2.png', color: AppColors.primaryFourthElementText,),
                ),
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/person2.png', color: AppColors.primaryElement,),
                ),
                label: 'profile',
              ),
            ],

          ),
        ),
        ),
      ),
    );
  }
}
