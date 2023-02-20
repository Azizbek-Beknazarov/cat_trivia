import 'package:equatable/equatable.dart';

class CatEntity extends Equatable{
String text;
DateTime createdAt;
CatEntity({required this.text,required this.createdAt});
  @override

  List<Object?> get props =>[];

}