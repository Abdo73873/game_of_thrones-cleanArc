import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String title;
  final String family;
  final String image;
  final String imageUrl;

  const Character({required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.title,
    required this.family,
    required this.image,
    required this.imageUrl});

  @override
  List<Object> get props =>
      [id, firstName, lastName, fullName, title, family, image, imageUrl,];

}
