import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/loginpage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff002F48),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: 420,
              height: 218,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 420,
                        height: 218,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'image/construction-silhouette.jpg',
                              ),
                              fit: BoxFit.cover),
                        ))),
                Positioned(
                    top: 0,
                    left: 1,
                    child: Container(
                        width: 420,
                        height: 218,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(
                              186, 220, 255, 0.15000000596046448),
                        ))),
              ]),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 85.0),
                  child: Container(
                    child: Stack(children: const <Widget>[
                      Positioned(
                        child: Text(
                          'Welcome Back',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 46,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Stack(children: const <Widget>[
                    Positioned(
                      child: Text(
                        'Login to Your Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'League Spartan'),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
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
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 8, right: 8, bottom: 5),
                      child: TextField(
                        controller: txtUsername,
                        decoration: const InputDecoration(
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
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 8, right: 8, bottom: 5),
                      child: TextField(
                        controller: txtPassword,
                        decoration: const InputDecoration(
                            hintText: 'Password', prefixIcon: Icon(Icons.lock)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                left: 170,
              ),
              child: Text(
                'Forget Password ?',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DM Sans',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
            Container(
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
                  _doLogin();
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DM Sans'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _doLogin() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(context: context, title: "Data Salah", type: AlertType.error)
          .show();
      return;
    }
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(message: 'Loading...');
    progressDialog.show();
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/login'),
        body: {'email': txtUsername.text, 'password': txtPassword.text},
        headers: {'Accept': 'application/json'});
    progressDialog.hide();
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, HomePage.routeName);
    } else {
      Alert(context: context, title: 'Gagal Login', type: AlertType.error)
          .show();
    }
  }
}
