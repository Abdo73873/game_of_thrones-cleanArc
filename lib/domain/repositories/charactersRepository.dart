import 'package:breaking_bed/domain/entits/characher.dart';

abstract class CharactersRepository{
Future<List<Character>> getCharacters();
}