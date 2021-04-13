import 'package:flutter/material.dart';

main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("SliverAppBar"),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 500,
                    child: Text("Yazı uzun olmadığı için height 500. Gerçek kullanımlarda heighte gerek yok"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
