import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';
import 'package:capstone_kuliku/presentation/bloc/kuli_bloc.dart';
import 'package:capstone_kuliku/presentation/pages/daftar_pesanan.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detailpage';
  final int id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailKuliBloc>().add(FetchDetailKuli(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Center(
                child: Text(
                  'Detail',
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
        body: BlocBuilder<DetailKuliBloc, KuliBlocState>(
            builder: (context, state) {
          if (state is KuliLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is KuliDetailHasData) {
            return SafeArea(
              child: DetailKuli(kuli: state.kulis),
            );
          } else if (state is KuliHasError) {
            return Center(
              key: const Key('error_message'),
              child: Text(state.message),
            );
          } else {
            return const Text('No Data');
          }
        }));
  }
}

class DetailKuli extends StatelessWidget {
  final KuliDetail kuli;
  const DetailKuli({Key? key, required this.kuli}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEFBFF),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  width: 345,
                  height: 215,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 4),
                          blurRadius: 4)
                    ],
                  ),
                  child: Image.asset(
                    kuli.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 364,
                      height: 78,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: Color(0xff9BB0B3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0, left: 20),
                            child: Text(
                              kuli.username.toString(),
                              style: const TextStyle(
                                  fontSize: 20.0, fontFamily: 'DM Sans'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 20),
                            child: Text(
                              kuli.alamat,
                              style: const TextStyle(
                                  fontSize: 15.0, fontFamily: 'Inter'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: Container(
                  width: 364,
                  height: 42,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: Color(0xff9BB0B3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 20),
                    child: Text(
                      kuli.skill,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: Container(
                  width: 364,
                  height: 202,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: Color(0xff9BB0B3),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                    child: Text(
                      kuli.deskripsi,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 25),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: Color(0xffD9D9D9),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.message_rounded,
                          size: 35,
                        ),
                        color: const Color(0xff25484D),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 190),
                    child: Container(
                      width: 120,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: Color(0xffD9D9D9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19.0, top: 17),
                        child: Text(
                          kuli.dailysal.toString(),
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DM Sans',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  width: 350,
                  height: 56,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff25484D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(46),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        DaftarPesanan.routeName,
                        arguments: kuli.id
                      );
                    },
                    child: const Text(
                      'CHECKOUT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DM Sans'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.star : Icons.star_border,
        color: Color(0xFFD2D79F),
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
