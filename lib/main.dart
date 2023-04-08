import 'package:breaking_bed/core/routes/routes.dart';
import 'package:breaking_bed/data/repositories/charactersRepositoryImp.dart';
import 'package:breaking_bed/data/web_services/web_services.dart';
import 'package:breaking_bed/domain/repositories/charactersRepository.dart';
import 'package:breaking_bed/domain/usecase/get_characters.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/bloc_observer.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();

  runApp(const GameOfThrones());
}

class GameOfThrones extends StatelessWidget {
  const GameOfThrones({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:AppRoutes.onGenerateRoute ,
    );
  }
}

