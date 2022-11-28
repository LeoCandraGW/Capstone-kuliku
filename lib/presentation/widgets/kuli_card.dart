import 'package:capstone_kuliku/presentation/pages/detail_page.dart';
import 'package:capstone_kuliku/presentation/provider/list_kuli.dart';
import 'package:flutter/material.dart';

class KuliCard extends StatelessWidget {
  const KuliCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final ListKuli kuli = listKuliku[index];
        return SingleChildScrollView(
          child: InkWell(
            onTap: (() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(kuli: kuli);
              }));
            }),
            child: Container(
              color: const Color(0xffDEFBFF),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 114,
                      decoration: const BoxDecoration(
                        color: Color(0xff9BB0B3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ],
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, bottom: 5, top: 5, right: 10),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              child: Image.asset(
                                kuli.imageAsset,
                                width: 80,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 230,
                              height: 75,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                  bottomLeft: Radius.circular(6),
                                  bottomRight: Radius.circular(6),
                                ),
                                color: Color.fromRGBO(217, 217, 217, 1),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(0, 4),
                                      blurRadius: 4)
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: const Color(0xffD9D9D9),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0, left: 8),
                                        child: Text(
                                          kuli.name,
                                          style: const TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'DM Sans'),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, left: 8),
                                        child: Text(
                                          kuli.alamat,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, left: 8),
                                        child: Text(
                                          kuli.skill,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
      itemCount: listKuliku.length,
    );
  }
}
