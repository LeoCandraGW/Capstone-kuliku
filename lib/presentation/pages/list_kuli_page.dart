import 'package:capstone_kuliku/presentation/widgets/kuli_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homepage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Center(
              child: Text(
              'Kuliku',
            ),
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {

              },
            ),
          ],
        ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          return const KuliCard();
        }
        ),
      ),
    );
  }
}