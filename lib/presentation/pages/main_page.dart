import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/mainpage";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002f48),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                 Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 20.0, right: 8.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Container(
                      width: 300,
                      height: 35,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Layanan, Kuli & tujuan',
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.message_outlined,
                  size: 35,),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
