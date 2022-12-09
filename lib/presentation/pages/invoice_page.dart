import 'package:flutter/material.dart';

class InvoicePage extends StatelessWidget {
  static const routeName = '/invoicepage';

  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Center(
                child: Text(
                  'Invoice',
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
            height: 600,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xffDEFBFF),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                      height: 150,
                      width: 150,
                      color: const Color(0xff002f48),
                      child: Image.asset(
                        'image/logo.png',
                        scale: 1,
                        fit: BoxFit.cover,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text('Nomor : '),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Tanggal/Jam : '),
                      Text(DateTime.now().toString())
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 170.0, top: 20, left: 30),
                  child: Container(
                    child: const Text('Invoice Kuliku',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 42),
                  child: Container(
                    child: const Text(
                        'Invoice ini merupakan bukti pembayaran yang sah.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                      width: 339,
                      height: 235,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                                width: 324,
                                height: 21,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ))),
                        Positioned(
                            top: 50,
                            left: 0,
                            child: Container(
                                width: 324,
                                height: 21,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ))),
                        Positioned(
                            top: 100,
                            left: 0,
                            child: Container(
                                width: 324,
                                height: 21,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ))),
                        Positioned(
                            top: 152,
                            left: 0,
                            child: Container(
                                width: 324,
                                height: 21,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ))),
                        Positioned(
                            top: 202,
                            left: 0,
                            child: Container(
                                width: 324,
                                height: 21,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ))),
                        const Positioned(
                            top: 3,
                            left: 6,
                            child: Text(
                              'Status ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 3,
                            left: 193,
                            child: Text(
                              'Transaksi Berhasil',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 27,
                            left: 6,
                            child: Text(
                              'Metode Pembayaran',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 28,
                            left: 193,
                            child: Text(
                              'Mobile Banking',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 78,
                            left: 6,
                            child: Text(
                              'Nomor Referensi ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 78,
                            left: 193,
                            child: Text(
                              '1112203930403',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 54,
                            left: 193,
                            child: Text(
                              '20:30',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 104,
                            left: 6,
                            child: Text(
                              'Nomor Pelanggan ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 104,
                            left: 192,
                            child: Text(
                              '39383218',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 156,
                            left: 6,
                            child: Text(
                              'Total Tagihan',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 155,
                            left: 193,
                            child: Text(
                              'Rp. 450.000',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 180,
                            left: 5,
                            child: Text(
                              'Biaya Admin',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 178,
                            left: 193,
                            child: Text(
                              'Rp. 2.500',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 206,
                            left: 5,
                            child: Text(
                              'Total Bayar',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 206,
                            left: 193,
                            child: Text(
                              'Rp. 452.500',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 127,
                            left: 6,
                            child: Text(
                              'Nama',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 127,
                            left: 192,
                            child: Text(
                              'Paijo De La Husa',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        const Positioned(
                            top: 54,
                            left: 5,
                            child: Text(
                              'Waktu',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                      ])),
                )
              ],
            ),
          ),
        ));
  }
}
