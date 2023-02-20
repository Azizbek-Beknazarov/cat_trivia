import 'package:equatable/equatable.dart';

class CatEntity extends Equatable{
String text;
DateTime updatedAt;
CatEntity({required this.text,required this.updatedAt});
  @override

  List<Object?> get props =>[];

}