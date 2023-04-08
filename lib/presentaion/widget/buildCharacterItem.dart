import 'package:breaking_bed/domain/entits/characher.dart';
import 'package:flutter/material.dart';

import '../../core/routes/routes.dart';
import '../../core/utils/app_colors.dart';

class BuildCharacterItem extends StatelessWidget {
  final Character character;
  const BuildCharacterItem(this.character,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.characterDetailsRoute,arguments: character);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(2.0),
        margin: const EdgeInsetsDirectional.all(4.0),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: GridTile(
          footer: Container(
            alignment: AlignmentDirectional.center,
            color: Colors.black54,
            child: Text(
              character.title,
              style: const TextStyle(
                color: AppColor.white,
                fontSize: 18.0,
              ),
            ),
          ),
          child: Hero(
            tag: character.id,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: character.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
