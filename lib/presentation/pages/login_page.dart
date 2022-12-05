import 'package:capstone_kuliku/presentation/pages/home_page.dart';
import 'package:capstone_kuliku/presentation/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/loginpage';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SignInScreen(
              providerConfigs: [
                EmailProviderConfiguration(),
              ],
            );
          }
          return const HomePage();
        });
  }
}
