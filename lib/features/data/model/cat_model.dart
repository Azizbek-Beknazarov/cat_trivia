import 'package:cat_trivia/features/domain/entity/cat_entity.dart';

class CatModel extends CatEntity {
  CatModel({required String text,  DateTime? createdAt})
      : super(text: text, createdAt: createdAt);

  factory CatModel.fromJson(Map<dynamic, dynamic> json) {
    return CatModel(text: json['text'] ?? "", createdAt: DateTime.tryParse(json['createdAt']));
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'text': text,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
