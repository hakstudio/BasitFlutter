import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth fauth = FirebaseAuth.instance;
  Future<dynamic> kayitOl(String eposta, String sifre) async {
    if (eposta != "" && sifre != "") {
      try {
        var kullaniciBilgisi = await fauth.createUserWithEmailAndPassword(
            email: eposta, password: sifre);
        return kullaniciBilgisi.user;
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "weak-password":
            return "Şifre En Az 6 Haneli Olmalı";
          case "email-already-in-use":
            return "E-Posta Zaten Kullanılıyor";
          default:
            return e.code;
        }
      }
    } else {
      return "Bilgileri Doldurun";
    }
  }

  Future<dynamic> girisYap(String eposta, String sifre) async {
    if (eposta != "" && sifre != "") {
      try {
        var kullaniciBilgisi = await fauth.signInWithEmailAndPassword(
            email: eposta, password: sifre);
        return kullaniciBilgisi.user;
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "user-not-found":
            return "Kullanıcı Bulunamadı";
          case "invalid-email":
            return "Geçersiz E-Posta";
          case "wrong-password":
            return "Yanlış Şifre";
          default:
            return e.code;
        }
      }
    } else {
      return "Bilgileri Doldurun";
    }
  }

  Future<dynamic> sifremiUnuttum(String eposta) async {
    if (eposta != "") {
      try {
        await fauth.sendPasswordResetEmail(email: eposta);
        return "Sıfırlama Linki Gönderildi";
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "user-not-found":
            return "Kullanıcı Bulunamadı";
          case "invalid-email":
            return "Geçersiz E-Posta";
          default:
            return e.code;
        }
      }
    } else {
      return "E-Posta Yazın";
    }
  }

  Future<dynamic> cikisYap() async {
    try {
      await fauth.signOut();
      return "Çıkış Yapıldı";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}
