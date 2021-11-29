import 'package:bloc_learn/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( BlocApp(appRouter: AppRouter()));
}

class BlocApp extends StatelessWidget {
   BlocApp({Key? key,required this.appRouter}) : super(key: key);

  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRout,
    );
  }
}
