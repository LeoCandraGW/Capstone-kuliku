import 'package:capstone_kuliku/presentation/widgets/kuli_card.dart';
import 'package:flutter/material.dart';

class ListKuliPage extends StatelessWidget {
  static const routeName = '/listkulipage';
  const ListKuliPage({super.key});

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
        backgroundColor: const Color(0xff002f48),
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