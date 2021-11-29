import 'package:bloc_learn/business_logic/cubit/char_cubit.dart';
import 'package:bloc_learn/data/models/characters.dart';
import 'package:bloc_learn/data/repostiry/char_repostiry.dart';
import 'package:bloc_learn/data/webservices/char_webservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home_page.dart';
import 'presentation/screens/home_page2.dart';

class AppRouter {
  late CharRepository charRepository;
  late CharCubit charCubit;
  AppRouter() {
    charRepository = CharRepository(CharWebServices());
    charCubit = CharCubit(charRepository);
  }

  Route? generateRout(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charCubit,
                  child: HomePage(),
                ),);
      case '/home_page2':
        return MaterialPageRoute(builder: (_) => HomePage2());
    }
  }
}
