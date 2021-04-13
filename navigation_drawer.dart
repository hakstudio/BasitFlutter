import 'package:flutter/material.dart';

main() => runApp(Uygulama());

class Uygulama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Navigation Drawer"),
          centerTitle: true,
        ),
        drawer: drawer(),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}

class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://lh3.googleusercontent.com/proxy/AtBMmqeRhQPXoALIVJZDPB5Sz02EDHDQk37J-lBfes4EVSPzrzIVB9LpGmm6v4nfsV4v_qBsPwYubCgh1QfFmP59f7f6ZhKQHPu3cRBCOfvOPSoX"),
              backgroundColor: Colors.white,
            ),
          ),
          Text("User"),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Ayarlar"),
            onTap: () => ayarlar(context),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Hakkında"),
            onTap: () => hakkinda(context),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Çıkış"),
            onTap: () => cikis(context),
          ),
        ],
      ),
    );
  }

  void ayarlar(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => ayarlarPage()));

  void hakkinda(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => hakkindaPage()));

  void cikis(BuildContext context) => Navigator.pop(context);
}

class ayarlarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
        centerTitle: true,
      ),
      body: RaisedButton(
        child: Text("Back"),
        onPressed: () => backbutton(context),
      ),
    ));
  }

  backbutton(BuildContext context) => Navigator.pop(context);
}

class hakkindaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Hakkında"),
        centerTitle: true,
      ),
      body: RaisedButton(
        child: Text("Back"),
        onPressed: () => backbutton(context),
      ),
    ));
  }

  backbutton(BuildContext context) => Navigator.pop(context);
}
