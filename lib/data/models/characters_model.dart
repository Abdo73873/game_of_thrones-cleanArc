import '../../domain/entits/characher.dart';

class CharacterModel extends Character {
  const CharacterModel({required super.id,
    required super.firstName,
    required super.lastName,
    required super.fullName,
    required super.title,
    required super.family,
    required super.image,
    required super.imageUrl});

  factory CharacterModel.fromJson(Map<String, dynamic> json)=>
      CharacterModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        fullName: json['fullName'],
        title: json['title'],
        family: json['family'],
        image: json['image'],
        imageUrl: json['imageUrl'],
      );

}
