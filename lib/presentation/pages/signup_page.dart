import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          
          Container(
            alignment: Alignment.topRight,
            child: Image.asset(
               'image/logo.png',
               height: 135,
               width: 135,
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
