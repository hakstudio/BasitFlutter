import 'package:flutter/material.dart';

void main() => runApp(BenimUyg());

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, //Bulunduğu yönde wrap_content
              children: <Widget>[
                //Kahve Image
                Container(
                  width: 200,
                  height: 200,
                  child: Image.network(
                      "https://i1.wp.com/www.muratoner.net/wp-content/uploads/2019/01/flutterlogo.png?fit=800%2C800&ssl=1"),
                ),

                //Başık Text
                Text(
                  "Flutter Kahvecisi",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.brown[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //Açıklama Text
                Text(
                  "Bir Kahve Uzağında",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                //E-Posta Text
                Card(
                  color: Colors.brown[900],
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.white,
                    ), //Iconlar : https://www.materialpalette.com/icons
                    title: Text(
                      "mail@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                //Telefon Text
                Card(
                  color: Colors.brown[900],
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Text(
                      "+90 123 456 78 90",
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
