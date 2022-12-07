import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:capstone_kuliku/presentation/pages/detail_page.dart';
import 'package:flutter/material.dart';

class KuliCard extends StatelessWidget {
  final Kuli kuli;
  const KuliCard(this.kuli);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: (() {
          Navigator.pushNamed(
            context,
            DetailPage.routeName,
            arguments: kuli.id,
          );
        }),
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
                          kuli.image.toString(),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, left: 8),
                                    child: Text(
                                      kuli.username.toString(),
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'DM Sans'),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 8),
                                    child: Text(
                                      kuli.dailysal.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, left: 8),
                                    child: Text(
                                      kuli.alamat.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
    );
  }
}
