import 'package:cat_trivia/features/domain/entity/random_image.dart';
import 'package:equatable/equatable.dart';

abstract class ImageEvents extends Equatable {
  const ImageEvents([List props = const <dynamic>[]]) : super();

  @override
  List<Object> get props => [props];
}

class ImageGetOneEvent extends ImageEvents {
  RandomImageEntity image;

  ImageGetOneEvent(this.image);
}