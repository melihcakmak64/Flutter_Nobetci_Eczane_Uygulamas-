import 'package:flutter/material.dart';

import '../models/PharmacyModel.dart';
import '../service/PharmacyService.dart';

class PharmacyScreen extends StatefulWidget {
  final String? sehir;
  const PharmacyScreen({super.key, required this.sehir});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  List<Model> eczaneList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    eczaneList = await EczaneServis().fetchData(widget.sehir!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Nöbetçi Eczaneler"),
      ),
      body: eczaneList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: eczaneList.length,
              itemBuilder: (context, index) {
                Model sehir = eczaneList[index];
                return myCard(sehir);
              }),
    );
  }

  Card myCard(Model sehir) {
    return Card(
        child: ListTile(
            title: Text(sehir.name ?? ""),
            subtitle: Text(sehir.address ?? "")));
  }
}
