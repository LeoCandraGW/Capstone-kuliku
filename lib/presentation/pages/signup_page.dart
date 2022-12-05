import 'package:capstone_kuliku/presentation/pages/login_page.dart';
import 'package:capstone_kuliku/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 732),
      builder: (BuildContext context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  'image/signup.jpg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'image/logo.png',
                      height: 135.h,
                      width: 135.w,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 319.w,
                    height: 182.h,
                    child: const Text(
                      'Build Your Dream House And Make Over Your Room',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 319.w,
                    height: 64.h,
                    child: const Text(
                      'find your best kuli and start your first brick with us!',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 286.w,
                    height: 56.h,
                    margin: const EdgeInsets.only(top: 150).w,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xffBADCFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25).w,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterPage.routeName);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'already have account ?',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        InkWell(
                          onTap: (() {
                            Navigator.pushNamed(context, LoginPage.routeName);
                          }),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              color: Color(0xFF75B4FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
