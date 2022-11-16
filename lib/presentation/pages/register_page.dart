import 'package:capstone_kuliku/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/registerpage';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff002F48),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child:
                      Stack(children: <Widget>[Image.asset('image/logo.png')]),
                ),
              ),
            ),
            const Text(
              'Register',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'League Spartan',
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                  height: 1),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 240,
                height: 70,
                child: Text(
                  'Create your account and start your building with us ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'League Spartan',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      height: 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 304,
                    height: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, top: 8, right: 8, bottom: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Username',
                            prefixIcon: Icon(Icons.person)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 304,
                    height: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, top: 8, right: 8, bottom: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Email Address',
                            prefixIcon: Icon(Icons.email)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 304,
                    height: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, top: 8, right: 8, bottom: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Password', prefixIcon: Icon(Icons.lock)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 304,
                    height: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, top: 8, right: 8, bottom: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            prefixIcon: Icon(Icons.lock)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      width: 304,
                      height: 56,
                      margin: const EdgeInsets.only(top: 100),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xff35516E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(46),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, LoginPage.routeName);
                        },
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DM Sans'),
                        ),
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
