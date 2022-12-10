import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';
import 'package:capstone_kuliku/presentation/bloc/kuli_bloc/kuli_bloc.dart';
import 'package:capstone_kuliku/presentation/pages/invoice_page.dart';
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

class CheckoutKuli extends StatefulWidget {
  final KuliDetail kuli;
  const CheckoutKuli({Key? key, required this.kuli}) : super(key: key);

  @override
  State<CheckoutKuli> createState() => _CheckoutKuliState();
}

class _CheckoutKuliState extends State<CheckoutKuli> {
  Metode? selectedMetode;
  List<Metode> metodes = [Metode('Virtual Account'), Metode('Bank Transfer')];

  List<DropdownMenuItem> generateItems(List<Metode> metodes) {
    List<DropdownMenuItem> items = [];
    for (var item in metodes) {
      items.add(
        DropdownMenuItem(child: Text(item.metode), value: item),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFdefbff),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
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
                        height: 194,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Image.asset(widget.kuli.image),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        widget.kuli.username,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        widget.kuli.dailysal.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8, top: 2),
                                      child: Text(
                                        widget.kuli.skill,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500),
                                      )),
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Payment',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      left: 24,
                                    ),
                                    child: Text(DateTime.now().toString())),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.kuli.username,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                widget.kuli.dailysal,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 3,
                          height: 2,
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                widget.kuli.dailysal,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 300,
                                height: 30,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(1),
                                    topRight: Radius.circular(1),
                                    bottomLeft: Radius.circular(1),
                                    bottomRight: Radius.circular(1),
                                  ),
                                  color: Color(0xffD9D9D9),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(0, 4),
                                        blurRadius: 4)
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 80.0),
                                  child: DropdownButton(
                                    hint: const Text(
                                      'Metode Pembayaran',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: selectedMetode,
                                    items: generateItems(metodes),
                                    onChanged: (item) {
                                      setState(() {
                                        selectedMetode = item;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 350,
                            height: 54,
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
                                  InvoicePage.routeName,
                                );
                              },
                              child: const Text(
                                'BAYAR',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
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

class Metode {
  String metode;
  Metode(this.metode);
}