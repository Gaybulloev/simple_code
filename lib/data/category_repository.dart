import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_code/data/model/character_model.dart';
import 'package:simple_code/utils/api_util.dart';

class CategoryRepository {

  Future<CharacterModel> getData({required int page}) async {
    try {
      final response = await http.get(Uri.parse(AppApi.characterApi + "?page=$page"));
      if (response.statusCode == 200) {

        return CharacterModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static List<Results> characters = [];
}
