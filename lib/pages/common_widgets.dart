import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/color.dart';

AppBar buildAppBar(String text){
  return AppBar(
    title: Text(text, style:  TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal
    ),),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(2),
      child: Container(
        color:AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),

  );
}

Widget buildThirdPartyLogin(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcon('google.png'),
        _reusableIcon('apple.png'),
        _reusableIcon('facebook.png'),
      ],
    ),
  );
}

Widget _reusableIcon(String iconName){
  return   GestureDetector(
    onTap: (){

    },
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName'),
    ),
  );
}
Widget reusableText(String text){
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.6),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp
      ),),
  );
}
Widget buildTextField(String hintText, String textType, String iconName, TextInputType keyboardType,
    void Function(String value)? func){
  return Container(
    height: 50.h,
    width: 325.w,
    margin: EdgeInsets.only(bottom: 25.h),
    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: AppColors.primaryFourthElementText),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset('assets/icons/$iconName.png'),
        ), SizedBox(
          height: 50.h,
          width: 270.w,
          child:  TextField(
            onChanged: func,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  ),

                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  ),

                ),
                hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText
                )
            ),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                fontSize: 14.sp
            ),
            autocorrect: false,
            obscureText: textType=='password'?true:false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword(){
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(left: 25.w),

    child: GestureDetector(
      onTap: (){

      },
      child: const Text(
        'Forgot password?',
        style: TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText
        ),

      ),
    ),
  );
}
Widget buildLogInAndRegButton(String buttonName, String buttonType,void Function()? func){
  return GestureDetector(
    onTap: func,
    child: Container(
      height: 50.h,
      width: 325.w,
      margin: EdgeInsets.only(left: 25.w,right: 25.w, top: buttonType=='login'? 40.h:20.h),
      decoration:  BoxDecoration(
          color: buttonType=='login'?AppColors.primaryElement:AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
              color: buttonType=='login'?Colors.transparent:AppColors.primaryFourthElementText
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0,1),
              spreadRadius: 1,
              blurRadius: 2,

            )
          ]
      ),
      child: Center(
        child: Text(buttonName,
          style: TextStyle(
            color: buttonType=='login'?AppColors.primaryBackground:AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,

          ),),
      ),
    ),
  );
}