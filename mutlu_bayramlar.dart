import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Hayırlı Bayramlar"),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: Center(
            child: Image.network(
                "https://www.elmasokagi.com/kent-karisik-bayram-sekeri-kg-bayram-sekeri-lokum-draje-kent-32150-21-B.jpg")),
      ),
    ),
  );
}
