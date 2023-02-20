import 'package:cat_trivia/features/domain/usecase/get_one_fact_usecase.dart';
import 'package:cat_trivia/features/presentation/bloc/cat_event.dart';
import 'package:cat_trivia/features/presentation/bloc/cat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecase/use_case.dart';
import '../../domain/usecase/get_facts_usecase.dart';

class CatBloc extends Bloc<CatEvents,CatStates>{

  final GetFacts facts;
  final GetOneFact factOne;

  CatBloc(this.facts,this.factOne):super(CatInitialState()){
    on<CatGetEvent>((event, emit) async {
      if (event is CatGetEvent) {
        emit(CatLoadingState());
        final failOrCat = await facts.call(NoParams());
        failOrCat.fold((l) => emit(CatErrorState(message: l.toString())),
                (cat) => emit(CatLoadedState(loaded: cat)));
      }
    });

    on<CatGetOneEvent>((event, emit) async {
      if (event is CatGetOneEvent) {
        emit(CatLoadingState());
        final failOrCat = await factOne.call(NoParams());
        failOrCat.fold((l) => emit(CatErrorState(message: l.toString())),
                (cat) => emit(CatLoadedOneState(loaded: cat)));
      }
    });
  }
}