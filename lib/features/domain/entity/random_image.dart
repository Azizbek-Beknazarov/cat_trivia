import 'package:equatable/equatable.dart';

class RandomImageEntity extends Equatable {
  String url;

  RandomImageEntity({required this.url});

  @override
  // TODO: implement props
  List<Object?> get props => [url];
}
