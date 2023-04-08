import 'package:breaking_bed/core/network/api_constant.dart';
import 'package:breaking_bed/data/models/characters_model.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<CharacterModel>> getAllCharacters() async {
    Response response = await Dio().get(ApiConstants.charactersUrl);
    try {
      return List.from((response.data).map((e)=> CharacterModel.fromJson(e)));
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
