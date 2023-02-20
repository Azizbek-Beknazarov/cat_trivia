import 'package:cat_trivia/features/domain/entity/cat_entity.dart';

class CatModel extends CatEntity {
  CatModel({required String text, required DateTime createdAt})
      : super(text: text, createdAt: createdAt);

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(text: json['text'] ?? "", createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'createdAt': createdAt,
    };
  }
}
