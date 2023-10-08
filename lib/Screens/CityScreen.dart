import 'package:flutter/material.dart';
import '../helper/cities.dart';
import 'PharmacyScreen.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final List<String> sehirler = Sehirler().sehirler;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text("Şehir Seçiniz")),
      body: ListView.builder(
        itemCount: sehirler.length,
        itemBuilder: (context, index) {
          String sehir = sehirler[index];
          return Card(
              child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PharmacyScreen(
                              sehir: sehir,
                            )));
                  },
                  title: Text(sehir)));
        },
      ),
    );
  }
}
