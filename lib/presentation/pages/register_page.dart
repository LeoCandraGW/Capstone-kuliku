import 'package:capstone_kuliku/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  static const routeName = '/registerpage';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtEmail = new TextEditingController();
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
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, top: 8, right: 8, bottom: 5),
                      child: TextField(
                        controller: txtUsername,
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
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, top: 8, right: 8, bottom: 5),
                      child: TextField(
                        controller: txtEmail,
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
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, top: 8, right: 8, bottom: 5),
                      child: TextField(
                        controller: txtPassword,
                        decoration: InputDecoration(
                            hintText: 'Password', prefixIcon: Icon(Icons.lock)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0),
            //   child: Stack(
            //     children: <Widget>[
            //       Container(
            //         width: 304,
            //         height: 60,
            //         decoration: const BoxDecoration(
            //             borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(12),
            //               topRight: Radius.circular(12),
            //               bottomLeft: Radius.circular(12),
            //               bottomRight: Radius.circular(12),
            //             ),
            //             color: Colors.white),
            //         child: const Padding(
            //           padding: EdgeInsets.only(
            //               left: 8.0, top: 8, right: 8, bottom: 5),
            //           child: TextField(
            //             decoration: InputDecoration(
            //                 hintText: 'Confirm Password',
            //                 prefixIcon: Icon(Icons.lock)),
            //           ),
            //         ),
            //       ),
                  
            //     ],
            //   ),
            // ),
            Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      width: 304,
                      height: 56,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xff35516E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(46),
                          ),
                        ),
                        onPressed: () {
                          _doRegister();
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
    );
  }
  Future _doRegister() async{
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(context: context, title: "Masukan Data", type: AlertType.error)
          .show();
      return;
    }
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(message: 'Loading...');
    progressDialog.show();
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/register'),
        body: {'username': txtUsername.text,'email': txtEmail.text, 'password': txtPassword.text},
        headers: {'Accept': 'application/json'});
        progressDialog.hide();
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, HomePage.routeName);
    } else {
      Alert(context: context, title: 'Gagal Register', type: AlertType.error)
          .show();
    }
  }
}
