import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountPage extends StatelessWidget {
  static const routeName = '/accountpage';
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 732),
      builder: (BuildContext context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Center(
                  child: Text(
                    'Account',
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            backgroundColor: const Color(0xff002f48),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: const Color(0xffDEFBFF),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0).r,
                      child: SizedBox(
                        height: 150.h,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(400)).w,
                          child: Image.asset('image/kuliku6.png'),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Nama Kuli',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.wallet),
                        Text(
                          ' 50.000,00',
                          style: TextStyle(fontSize: 16, fontFamily: 'Inter'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 350.w,
                    height: 50.h,
                    margin: const EdgeInsets.only(top: 30),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xff25484D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 85.0),
                            child: Text(
                              'Daftar Kuli Gratis',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'DM Sans'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 30),
                    child: Row(
                      children: const [
                        Text(
                          'Aktivitas Saya',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 6),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.folder_copy,
                            color: Colors.black,
                          ),
                          Text(
                            '  Daftar Transaksi',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 27,
                            color: Colors.black,
                          ),
                          Text(
                            '  Kuli Favorit',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 15).r,
                    child: Row(
                      children: const [
                        Text(
                          'Pusat Bantuan',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 6).r,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.perm_phone_msg_outlined,
                            color: Colors.black,
                          ),
                          Text(
                            '  Pesanan Dikomplain',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.support_agent_sharp,
                            size: 27,
                            color: Colors.black,
                          ),
                          Text(
                            '  Bantuan Kuliku Pusat',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
