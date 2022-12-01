import 'package:capstone_kuliku/common/utils.dart';
import 'package:capstone_kuliku/presentation/bloc/kuli_bloc.dart';
import 'package:capstone_kuliku/presentation/pages/account_page.dart';
import 'package:capstone_kuliku/presentation/pages/detail_page.dart';
import 'package:capstone_kuliku/presentation/pages/home_page.dart';
import 'package:capstone_kuliku/presentation/pages/list_kuli_page.dart';
import 'package:capstone_kuliku/presentation/pages/login_page.dart';
import 'package:capstone_kuliku/presentation/pages/main_page.dart';
import 'package:capstone_kuliku/presentation/pages/register_page.dart';
import 'package:capstone_kuliku/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:capstone_kuliku/injection.dart' as di;
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //kuli
        BlocProvider(create: (_) => di.locator<GetKuliListBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignUpPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case ListKuliPage.routeName:
              return MaterialPageRoute(builder: (_) => const ListKuliPage());
            case HomePage.routeName:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case LoginPage.routeName:
              return MaterialPageRoute(builder: (_) => const LoginPage());
            case RegisterPage.routeName:
              return MaterialPageRoute(builder: (_) => const RegisterPage());
            case MainPage.routeName:
              return MaterialPageRoute(builder: (_) => const MainPage());
            case AccountPage.routeName:
              return MaterialPageRoute(builder: (_) => const AccountPage());
            case DetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => DetailPage(id: id),
                settings: settings,
              );
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
      ),
    );
  }
}
