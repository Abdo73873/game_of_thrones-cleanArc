
import 'package:breaking_bed/business_logic/characters_cubit.dart';
import 'package:breaking_bed/core/utils/app_colors.dart';
import 'package:breaking_bed/core/utils/app_string.dart';
import 'package:breaking_bed/data/repositories/charactersRepositoryImp.dart';
import 'package:breaking_bed/data/web_services/web_services.dart';
import 'package:breaking_bed/domain/usecase/get_characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../widget/buildCharacterItem.dart';

class CharactersScreen extends StatelessWidget {
  CharactersScreen({Key? key}) : super(key: key);
  final CharactersCubit charactersCubit = CharactersCubit(
      GetCharactersUseCase(CharactersRepositoryImp(CharactersWebServices())));
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, value, child){
        final bool connected=value !=ConnectivityResult.none;
        if(connected) {
          return viewListWhenConnected(context);
        }
        else{
         return   const Scaffold(body: Center(child: Text('no Internet')));
        }
      },
      child: const Center(child: CircularProgressIndicator()),
    );
  }

Widget viewListWhenConnected(context)=>BlocProvider.value(
  value: charactersCubit..getAllCharacters(),
  child: BlocBuilder<CharactersCubit, CharactersState>(
    builder: (context, state) {
      var cubit = CharactersCubit.get(context);
      return Scaffold(
        backgroundColor: AppColor.gray,
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          titleSpacing: 0,
          centerTitle: true,
          title: searchFromAppBar(context),
          actions: !cubit.openToSearch
              ? [
            IconButton(
                onPressed: () {
                  changeSearchToOpen(context);
                },
                icon: const Icon(Icons.search)),
          ]
              : null,
        ),
        body: cubit.allCharacters.isNotEmpty
            ? buildListOfCharacters(context)
            : const Center(child: CircularProgressIndicator()),
      );
    },
  ),
);
  Widget buildListOfCharacters(context)=>SingleChildScrollView(
    child: GridView.builder(
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3 / 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) =>
      searchController.text.isNotEmpty&&CharactersCubit.get(context).openToSearch
          ?BuildCharacterItem(CharactersCubit.get(context).characterSearch[index])
          :BuildCharacterItem(CharactersCubit.get(context).allCharacters[index]),
      itemCount: searchController.text.isNotEmpty&&CharactersCubit.get(context).openToSearch
          ? CharactersCubit.get(context).characterSearch.length
          :CharactersCubit.get(context).allCharacters.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
    ),
  );

  Widget searchFromAppBar(context) {
    if (!CharactersCubit.get(context).openToSearch) {
      return const Text(AppStrings.character);
    }
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: searchController,
            autofocus: true,
            style: const TextStyle(
              color: Colors.white,
              textBaseline: TextBaseline.alphabetic,
            ),
            onChanged: (text) {
              CharactersCubit.get(context).searchInCharacters(text);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              hintText: 'find the character ...',
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.0),
              ),
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              searchController.clear();
              CharactersCubit.get(context).searchInCharacters(searchController.text);
            },
            icon: const Icon(Icons.close)),
      ],
    );
  }

  void changeSearchToOpen(context) {
    if (CharactersCubit.get(context).openToSearch) {
      CharactersCubit.get(context).changeOpenToSearch(false);
    } else {
      CharactersCubit.get(context).changeOpenToSearch(true);
      ModalRoute.of(context)
          ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
        CharactersCubit.get(context).changeOpenToSearch(false);
      }));
    }
  }
}
