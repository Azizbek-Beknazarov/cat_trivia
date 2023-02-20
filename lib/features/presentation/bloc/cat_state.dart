import 'package:cat_trivia/features/domain/entity/cat_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CatStates extends Equatable {
  const CatStates();

  @override
  List<Object> get props => [];
}

class CatInitialState extends CatStates {}

class CatLoadingState extends CatStates {}
class CatLoadedState extends CatStates {
  final List<CatEntity> loaded;

  CatLoadedState({required this.loaded});

  @override
  List<Object> get props => [loaded];
}
class CatErrorState extends CatStates {
  final String message;

  const CatErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
