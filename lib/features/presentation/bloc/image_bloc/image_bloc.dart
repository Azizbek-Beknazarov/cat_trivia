
import 'package:cat_trivia/features/presentation/bloc/image_bloc/image_event.dart';
import 'package:cat_trivia/features/presentation/bloc/image_bloc/image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../domain/usecase/image_usecase.dart';

class ImageBloc extends Bloc<ImageEvents,ImageStates>{


  final GetImageUseCase imageUseCase;

  ImageBloc(this.imageUseCase):super(ImageInitialState()){
    on<ImageGetOneEvent>((event, emit) async {
      if (event is ImageGetOneEvent) {
        emit(ImageLoadingState());
        final failOrImage = await imageUseCase.call(NoParams());
        failOrImage.fold((l) => emit(ImageErrorState(message: l.toString())),
                (cat) => emit(ImageLoadedOneState(loaded: cat)));
      }
    });


  }
}