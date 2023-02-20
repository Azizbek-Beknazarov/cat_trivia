import 'package:cat_trivia/features/domain/entity/cat_entity.dart';
import 'package:cat_trivia/features/presentation/bloc/cat_bloc.dart';
import 'package:cat_trivia/features/presentation/bloc/cat_event.dart';
import 'package:cat_trivia/features/presentation/bloc/cat_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/random_image.dart';
import '../bloc/image_bloc/image_bloc.dart';
import '../bloc/image_bloc/image_event.dart';
import '../bloc/image_bloc/image_state.dart';
import 'another_fact.dart';

class CatsPage extends StatefulWidget {
  const CatsPage({Key? key}) : super(key: key);

  @override
  State<CatsPage> createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  List<CatEntity> facts = [];
  RandomImageEntity imageEntity=RandomImageEntity(url: "https://cataas.com/cat");

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CatBloc>(context, listen: false).add(CatGetEvent(facts));
    // BlocProvider.of<ImageBloc>(context, listen: false)
    //     .add(ImageGetOneEvent(imageEntity));
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
      } else if (state is CatLoadedState) {
        facts = state.loaded;
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

      return  BlocBuilder<ImageBloc,ImageStates>(builder: (context,state){

        if(state is ImageLoadedOneState){
          imageEntity=state.loaded;
        }
        return Scaffold(
          appBar: AppBar(centerTitle: true,
            title: Text('Cat facts'),
          ),
          body: Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
                itemCount: facts.length,
                itemBuilder: (context, index) {
                  String formattedDate = DateFormat('dd/MM/yyyy').format(facts[index].createdAt!);
                  return ListTile(
                    leading: Image.network(imageEntity.url),
                    title: Text(facts[index].text),
                    subtitle: Text(formattedDate),
                  );
                }),
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AnotherFact()));
          },child:  Text('One'),),
        );
      });




      // Container(child: Image.network(imageEntity.url),)


      //

    });
  }
}
