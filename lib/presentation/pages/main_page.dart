import 'package:capstone_kuliku/presentation/provider/list_kuli.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/mainpage";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEFBFF),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
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
                  height: 150.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: [1, 2, 3, 4].map((i) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Color(0xFF002f48)),
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
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
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
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: SizedBox(
                              height: 65,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(28)),
                                child: Image.asset(kuli.imageAsset),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                            child: Text(kuli.name),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: listKuliku.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Apa Kebutuhanmu ? ',
                    style: TextStyle(
                      color: Color(0xFF002f48),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 240,
              child: SkillGridView())
          ],
        ),
      ),
    );
  }
}

class SkillGridView extends StatelessWidget{
  const SkillGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 300,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 25,
          height: 25,
          child: Card(
            color: Colors.amber,
            child: Center(child: Text('$index')),
          ),
        );
      }
    );
  }

}
