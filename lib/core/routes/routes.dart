
import 'package:breaking_bed/presentaion/screens/characters_screen.dart';
import 'package:flutter/material.dart';

import '../../domain/entits/characher.dart';
import '../../presentaion/screens/characters_details.dart';
import '../utils/app_string.dart';


class Routes{
  static const String initialRoute='/';
  static const String characterDetailsRoute='/character_details';
}

class AppRoutes{
  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) =>  CharactersScreen(),);
      case Routes.characterDetailsRoute:
        Character character=routeSettings.arguments as Character;
        return MaterialPageRoute(builder: (context) =>  CharactersDetailsScreen(character: character),);
      default:
        return undefineRoute();
    }
  }


  static Route<dynamic> undefineRoute(){
    return MaterialPageRoute(builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),);
  }
}

