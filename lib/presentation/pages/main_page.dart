import 'package:capstone_kuliku/presentation/provider/list_kuli.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/auth.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/mainpage";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 732),
      builder: (BuildContext context, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFDEFBFF),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 65.h,
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xFF002f48),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 20.0, right: 8.0),
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: Container(
                                    height: 30.h,
                                    width: 310.w,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
                                  width: 300.w,
                                  child: const TextField(
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
                                size: 35,
                              ),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                      ),
                      items: [1, 2, 3, 4].map((i) {
                        return Builder(builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration:
                                const BoxDecoration(color: Color(0xFF002f48)),
                            child: Text(
                              'text $i',
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          );
                        });
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Kuli Rekomendasi',
                          style: TextStyle(
                            color: Color(0xFF002f48),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final ListKuli kuli = listKuliku[index];
                        return SizedBox(
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 13,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(28)),
                                      child: Image.asset(kuli.imageAsset),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(kuli.name),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: listKuliku.length,
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 7.0, vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Apa Kebutuhanmu ? ',
                        style: TextStyle(
                          color: Color(0xFF002f48),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        topRight: Radius.circular(32),
                                        bottomLeft: Radius.circular(32),
                                        bottomRight: Radius.circular(32),
                                      ),
                                      color: Color(0xff9BB0B3),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black54,
                                            offset: Offset(0, 4),
                                            blurRadius: 4)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(28)),
                                        child: Image.asset(
                                          'image/House.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      'House',
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'DM Sans'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Stack(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32),
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                        ),
                                        color: Color(0xff9BB0B3),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(28)),
                                          child: Image.asset(
                                            'image/CloseUp.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        'Yard',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'DM Sans'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Stack(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32),
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                        ),
                                        color: Color(0xff9BB0B3),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(28)),
                                          child: Image.asset(
                                            'image/Group.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        'Renovate',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'DM Sans'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        topRight: Radius.circular(32),
                                        bottomLeft: Radius.circular(32),
                                        bottomRight: Radius.circular(32),
                                      ),
                                      color: Color(0xff9BB0B3),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black54,
                                            offset: Offset(0, 4),
                                            blurRadius: 4)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(28)),
                                        child: Image.asset(
                                          'image/DesignServices.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      'Design\n' 'Interior',
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'DM Sans'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Stack(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32),
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                        ),
                                        color: Color(0xff9BB0B3),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(28)),
                                          child: Image.asset(
                                            'image/MeetingRoom.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        'Room\n' 'Makeover',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'DM Sans'),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Stack(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32),
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                        ),
                                        color: Color(0xff9BB0B3),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(28)),
                                          child: Image.asset(
                                            'image/Trust.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        'House\n' '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'DM Sans'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SignOutButton()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
