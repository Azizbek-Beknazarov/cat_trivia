import 'package:cat_trivia/features/domain/entity/cat_entity.dart';
import 'package:cat_trivia/features/domain/entity/random_image.dart';
import 'package:equatable/equatable.dart';

abstract class ImageStates extends Equatable {
  const ImageStates();

  @override
  List<Object> get props => [];
}

class ImageInitialState extends ImageStates {}

class ImageLoadingState extends ImageStates {}

class ImageErrorState extends ImageStates {
  final String message;

  const ImageErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
class ImageLoadedOneState extends ImageStates {
  final RandomImageEntity loaded;

  ImageLoadedOneState({required this.loaded});

  @override
  List<Object> get props => [loaded];
}
