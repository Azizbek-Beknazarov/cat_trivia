import 'dart:convert';

import 'package:cat_trivia/core/error/exception.dart';
import 'package:cat_trivia/features/data/model/cat_model.dart';
import 'package:http/http.dart' as http;

const BASE_URL = "https://cat-fact.herokuapp.com";

abstract class CatRemoteDataSource {
  Future<List<CatModel>> getFacts();
  Future< CatModel> getOneFact();
}

class CatRemoteDataSourceImple implements CatRemoteDataSource {
  final http.Client client;

  CatRemoteDataSourceImple({required this.client});

  @override
  Future<List<CatModel>> getFacts() async {
    final url = "$BASE_URL/facts/random?animal_type=cat&amount=20";
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    print("::::url: ${url}");
    print("::::response body: ${response.body}");
    if (response.statusCode != 200) {
      throw ServerException();
    }

    //error fixed here
    final jsonData = json.decode(response.body);
    List<CatModel> model = jsonData
        .map<CatModel>((e) => CatModel.fromJson(e))
        .toList();
    print(model);
    return Future.value(model);
  }

  @override
  Future<CatModel> getOneFact() async{
    final url = "$BASE_URL/facts/random?animal_type=cat&amount=1";
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    print("::::url: ${url}");
    print("::::response body: ${response.body}");
    if (response.statusCode != 200) {
      throw ServerException();
    }



    CatModel model=CatModel.fromJson(json.decode(response.body));
    print(model);
    return Future.value(model);
  }
}
