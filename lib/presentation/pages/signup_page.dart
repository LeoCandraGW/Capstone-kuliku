import 'package:capstone_kuliku/presentation/pages/home_page.dart';
import 'package:capstone_kuliku/presentation/pages/list_kuli_page.dart';
import 'package:capstone_kuliku/presentation/pages/login_page.dart';
import 'package:capstone_kuliku/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
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
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'image/logo.png',
                      height: 135,
                      width: 135,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 20),
                    child: Container(
                      alignment: Alignment.topRight,
                      width: 260,
                      height: 182,
                      child: const Text(
                        'Build Your Dream House and Make Over Your Room',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: 319,
                        height: 64,
                        child: const Expanded(
                          child: Text(
                            'find your best kuli and start your first brick with us!',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'LeagueSpartan',
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: 286,
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffBADCFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegisterPage.routeName);
                          },
                          child: const Expanded(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 90.0),
                            child: Flexible(
                              flex: 1,
                              child: Text(
                                'already have account ?',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF), fontSize: 17),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              ' Log In',
                              style: TextStyle(
                                  color: Color(0xFF75B4FF), fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
