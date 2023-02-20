import 'dart:convert';

import 'package:cat_trivia/features/data/model/cat_model.dart';
import 'package:http/http.dart' as http;

const BASE_URL ="https://cat-fact.herokuapp.com";

abstract class CatRemoteDataSource {
  Future<List<CatModel>> getFacts();
}

class CatRemoteDataSourceImple implements CatRemoteDataSource {
  final http.Client client;

  CatRemoteDataSourceImple({required this.client});

  @override
  Future<List<CatModel>> getFacts() async {
    final response = await client.get(
        Uri.parse("$BASE_URL/facts/random?animal_type=cat"),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception('Xatolik');
    }

    // Iterable l = json.decode(response.body);
    // print(l);
    // List<CatModel> posts = List<CatModel>.from(l.map((model)=> CatModel.fromJson(model)));


    List<CatModel> model = (json.decode(response.body) )
        .map((e) => CatModel.fromJson(e) )
        .toList();
    print(model);
    return Future.value(model);
  }
}
