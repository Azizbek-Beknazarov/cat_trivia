import 'package:cat_trivia/features/domain/entity/cat_entity.dart';

import 'package:cat_trivia/features/presentation/bloc/cat_bloc.dart';
import 'package:cat_trivia/features/presentation/bloc/cat_event.dart';
import 'package:cat_trivia/features/presentation/bloc/cat_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
class AnotherFact extends StatefulWidget {
  const AnotherFact({Key? key}) : super(key: key);

  @override
  State<AnotherFact> createState() => _AnotherFactState();
}

class _AnotherFactState extends State<AnotherFact> {
  CatEntity onefacts = CatEntity(text: 'a', createdAt: null);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CatBloc>(context, listen: false)
        .add(CatGetOneEvent(onefacts));
    return BlocBuilder<CatBloc, CatStates>(builder: (context, state) {

      if (state is CatLoadingState) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(),
              ),
              Text('Loading data...'),
            ],
          ),
        );
      } else if (state is CatLoadedOneState) {
        onefacts = state.loaded;
      } else if (state is CatErrorState) {
        return Column(
          children: [
            Center(
              child: CircularProgressIndicator(),
            ),
            Text(state.message),
          ],
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text("One cat fact "),
        ),
        body: ListTile(
          title: Text(onefacts.text),
          subtitle: Text( DateFormat('dd/MM/yyyy').format(onefacts.createdAt!)),
        ),
      );
    });
  }
}
