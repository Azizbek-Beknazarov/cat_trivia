import 'dart:convert';

import 'package:cat_trivia/features/data/model/cat_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/exception.dart';
const CACHED_CAT="CACHED_CAT";
abstract class CatLocalDataSource {

  Future<List<CatModel>> getCatFromCache();
  Future<void> catToCache(List<CatModel> catToCache);
 
}
class CatLocalDataSourceImpl implements CatLocalDataSource{
  final SharedPreferences preferences;
  CatLocalDataSourceImpl({required this.preferences});

  @override
  Future<List<String>> catToCache(List<CatModel> catToCache) {
    final List<String> jsonCatList =
    catToCache.map((cat) => json.encode(cat.toJson())).toList();

    preferences.setStringList(CACHED_CAT, jsonCatList);

    return Future.value(jsonCatList);
  }

  @override
  Future<List<CatModel>> getCatFromCache() {
    final jsonCatList =
    preferences.getStringList(CACHED_CAT);
    if (jsonCatList!.isNotEmpty) {

      return Future.value(jsonCatList
          .map((cat) => CatModel.fromJson(json.decode(cat)))
          .toList());
    } else {
      throw CacheException();
    }
  }
 
}