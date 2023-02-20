import 'package:cat_trivia/features/domain/entity/cat_entity.dart';

class CatModel extends CatEntity {
  CatModel({required String text, required DateTime updatedAt})
      : super(text: text, updatedAt: updatedAt);

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(text: json['text'] ?? "", updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'updatedAt': updatedAt,
    };
  }
}
