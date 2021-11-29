// ignore_for_file: prefer_const_constructors

import 'package:bloc_learn/business_logic/cubit/char_cubit.dart';
import 'package:bloc_learn/data/models/characters.dart';
import 'package:bloc_learn/presentation/widgets/char_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Character>? allcharacters;

  @override
  void initState() {
    super.initState();
    allcharacters = BlocProvider.of<CharCubit>(context).getAllCharecters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharCubit, CharState>(
      builder: (context, state) {
        if (state is CharsLoaded) {
          allcharacters = (state).chars;
          return buildLoadedListWidgets();
        } else {return showLoadingIndicator();}
      },
    );
  }

  Widget showLoadingIndicator(){
    return Center(
      child: CircularProgressIndicator(
        color: Colors.pinkAccent,
      ),
    );
  }

  Widget buildLoadedListWidgets(){
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
          child: Column(
            children: [
              buildCharList(),
            ],
          ),
      ),
    );
  }

  Widget buildCharList(){
    return GridView.builder(
      shrinkWrap: true,
        padding: EdgeInsets.zero ,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
        childAspectRatio: 2/3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1),
        itemCount: allcharacters!.length,
        itemBuilder: (context,index){
          return CharItem(character: allcharacters![index],);
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        title: Text('Bloc/API call test'),
      ),
      body: buildBlocWidget(),
    );
  }
}
