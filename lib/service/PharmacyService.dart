import 'dart:convert';
import 'package:hava_durumu/models/PharmacyModel.dart';
import 'package:http/http.dart' as http;

class EczaneServis {
  Future<List<Model>> fetchData(String sehir) async {
    print(sehir);
    List<Model> modelList = [];

    Uri uri =
        Uri.parse("https://api.collectapi.com/health/dutyPharmacy?il=${sehir}");
    var response = await http.get(uri, headers: {
      'authorization': "apikey 0o892m5JYTzB1T8cIUrg3i:5ST8Z4jt42s7BFE1mXWF1W",
      'content-type': "application/json"
    });
    var json = jsonDecode(response.body);

    for (var element in json["result"]) {
      modelList.add(Model.fromJson(element));
    }

    return modelList;
  }
}
