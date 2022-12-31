import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayitahminuygulamasi/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
    print("Rastege sayi : $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Hak : $kalanHak",
              style: TextStyle(color: Colors.pink, fontSize: 30),
            ),
            Text(
              "Yardım : $yonlendirme",
              style: TextStyle(color: Colors.black54, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Tahmin",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      kalanHak = kalanHak - 1;
                    });

                    int tahmin = int.parse(tfTahmin.text);
                    if (tahmin == rastgeleSayi) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SonucEkrani(sonuc: true,)));
                      return;
                    }

                    if (tahmin > rastgeleSayi) {
                      setState(() {
                        yonlendirme = "Tahmini azalt";
                      });
                    }
                    if (tahmin < rastgeleSayi) {
                      setState(() {
                        yonlendirme = "Tahmini arttır";
                      });
                    }

                    if (kalanHak == 0) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SonucEkrani(sonuc: false,)));
                    }

                    tfTahmin.text="";
                  },
                  child: Text("TAHMİN ET"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                ))
          ],
        ),
      ),
    );
  }
}
