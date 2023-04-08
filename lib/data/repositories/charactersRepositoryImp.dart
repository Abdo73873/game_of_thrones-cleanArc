import 'package:breaking_bed/data/models/characters_model.dart';
import 'package:breaking_bed/data/web_services/web_services.dart';
import 'package:breaking_bed/domain/entits/characher.dart';
import 'package:breaking_bed/domain/repositories/charactersRepository.dart';

class CharactersRepositoryImp extends CharactersRepository{
  CharactersWebServices charactersWebServices;

  CharactersRepositoryImp(this.charactersWebServices);

  @override
  Future<List<Character>> getCharacters() async {
     return  await charactersWebServices.getAllCharacters();
  }}