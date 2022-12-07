import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';
import 'package:capstone_kuliku/presentation/bloc/kuli_bloc.dart';
import 'package:capstone_kuliku/presentation/provider/list_kuli.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaftarPesanan extends StatefulWidget {
  static const routeName = '/daftarpesanan';
  final int id;
  const DaftarPesanan({Key? key, required this.id}) : super(key: key);

  @override
  State<DaftarPesanan> createState() => _DaftarPesananState();
}

class _DaftarPesananState extends State<DaftarPesanan> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailKuliBloc>().add(FetchDetailKuli(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailKuliBloc, KuliBlocState>(
        builder: (context, state) {
      if (state is KuliLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is KuliDetailHasData) {
        return SafeArea(
          child: CheckoutKuli(kuli: state.kulis),
        );
      } else if (state is KuliHasError) {
        return Center(
          key: const Key('error_message'),
          child: Text(state.message),
        );
      } else {
        return const Text('No Data');
      }
    });
  }
}

class CheckoutKuli extends StatelessWidget {
  final KuliDetail kuli;
  const CheckoutKuli({Key? key, required this.kuli}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFdefbff),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    color: const Color(0xFF002f48),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    child: Container(
                      width: 350,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xff9BB0B3),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        4, 6), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Image.asset(kuli.image),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(kuli.username)),
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(kuli.dailysal.toString())),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 16),
                                    child: Text('Hari')),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: PlusMinusButtons(
                                    addQuantity: () {},
                                    deleteQuantity: () {},
                                    text: ('1'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: 350,
                  height: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xff9BB0B3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Payment',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 24,
                                ),
                                child: Text(DateTime.now().toString()))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Text(kuli.username),
                            Text(kuli.dailysal)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Text('Total'),
                            Text(kuli.dailysal)
                          ],
                        ),
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
                              
                            },
                            child: const Text(
                              'Bayar',
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
            ],
          ),
        ),
      ),
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
}
