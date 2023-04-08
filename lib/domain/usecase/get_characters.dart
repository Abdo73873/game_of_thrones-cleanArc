
import '../entits/characher.dart';
import '../repositories/charactersRepository.dart';

class GetCharactersUseCase {
   CharactersRepository charactersRepository;

   GetCharactersUseCase(this.charactersRepository);

   Future<List<Character>> call() async {
    return await charactersRepository.getCharacters();
  }
}