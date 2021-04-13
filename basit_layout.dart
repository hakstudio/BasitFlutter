import 'package:flutter/material.dart';

void main() {
  runApp(BenimUyg());
}

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Column(
            //Column Dikey, Row Yatay
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // İçinde bulunduğu child hangi yödeyse o yönün tersine kadar uzayabildiğince uzamak. Mesela Column Dikey olduğundan yatay uzuyor(match_parent). Varolduğu yere uzatmak için mainAxisAlignment kullanılır.
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // İçinde bulunduğu child hangi yödeyse o yönde eşit olarak paylaştırma.
            //mainAxisAlignment: MainAxisAlignment.
            //crossAxisAlignment: CrossAxisAlignment.
            //Yukarıdaki ilki hangi yöndeyse o yön. İkincisi tersi yön.
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.pink,
                child: Text("Text1"),
              ),
              //SizedBox(height: 8),//8dp boşluk
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.lightBlue,
                child: Text("Text2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
