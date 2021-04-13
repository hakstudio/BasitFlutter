import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Default Tab Controller"),
            bottom: TabBar(
              tabs: [
                Tab(child: Text("Araba")),
                Tab(child: Text("Tren")),
                Tab(child: Text("Bisiklet")),
              ],
            ),
          ),
          body: TabBarView(children: [
            Icon(Icons.directions_car,),
            Icon(Icons.directions_transit,),
            Icon(Icons.directions_bike,),
          ],),
        ),
      ),
    );
  }
}
