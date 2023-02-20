import 'dart:convert';

import 'package:cat_trivia/features/data/model/image_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/error/exception.dart';

const BASE_URL = "https://cataas.com/cat";

abstract class ImageRemoteDataSource {
  Future<ImageModel> getImage();
}

class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  final http.Client client;

  ImageRemoteDataSourceImpl({required this.client});

  @override
  Future<ImageModel> getImage() async {
    final response = await client.get(Uri.parse(BASE_URL),
        headers: {'Content-Type': 'application/json'});
    print("::::image url: ${response.body}");

    if (response.statusCode != 200) {
      throw ServerException();
    }

    ImageModel model = ImageModel.fromJson(json.decode(response.body));

    return Future.value(model);
  }
}
