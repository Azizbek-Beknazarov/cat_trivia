import 'package:cat_trivia/features/domain/entity/random_image.dart';

class ImageModel extends RandomImageEntity{
  ImageModel({required String url}):super(url: url);

  factory ImageModel.fromJson(Map<dynamic, dynamic> json) {
    return ImageModel(url: json['url'] ?? "",);
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'url': url,

    };
  }

}