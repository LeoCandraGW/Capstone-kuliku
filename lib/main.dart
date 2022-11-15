import 'package:capstone_kuliku/common/utils.dart';
import 'package:capstone_kuliku/presentation/pages/home_page.dart';
import 'package:capstone_kuliku/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpPage(),
      navigatorObservers: [routeObserver],
       onGenerateRoute: (RouteSettings settings){
        switch(settings.name){
          case HomePage.routeName:
          return MaterialPageRoute(builder: (_)=> const HomePage());
          default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
        }
      },
    );
  }
}



