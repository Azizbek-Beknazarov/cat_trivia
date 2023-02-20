import 'package:cat_trivia/features/domain/entity/cat_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CatEvents extends Equatable {
  const CatEvents([List props = const <dynamic>[]]) : super();

  @override
  List<Object> get props => [props];
}
class CatGetEvent extends CatEvents {
  List<CatEntity> list;

  CatGetEvent(this.list);
}
class CatGetOneEvent extends CatEvents {
  CatEntity list;

  CatGetOneEvent(this.list);
}