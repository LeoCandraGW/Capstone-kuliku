import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  static const routeName = '/accountpage';
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(),
    );
  }
}
