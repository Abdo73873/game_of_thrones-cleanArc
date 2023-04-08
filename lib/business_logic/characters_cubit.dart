import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/entits/characher.dart';
import '../domain/usecase/get_characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final GetCharactersUseCase getCharactersUseCase;

  CharactersCubit(this.getCharactersUseCase) : super(CharactersInitial());

  static CharactersCubit get(context) => BlocProvider.of(context);

  List<Character> allCharacters = [];

  void getAllCharacters() async {
    List<Character> result = await getCharactersUseCase();
    print(result);
    allCharacters = result;
    emit(CharactersLoadedState());
  }

  List<Character> characterSearch = [];

  void searchInCharacters(String text) {
    characterSearch = [];
    characterSearch = allCharacters
        .where((element) =>
            element.title.toLowerCase().startsWith(text.toLowerCase()))
        .toList();
    emit(SearchInCharactersState());
  }

  bool openToSearch = false;

  void changeOpenToSearch(bool isOpen) {
    openToSearch = isOpen;
    emit(ChangeToSearchState());
  }
}
