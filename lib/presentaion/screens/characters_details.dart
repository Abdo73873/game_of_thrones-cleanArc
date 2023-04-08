import 'package:breaking_bed/core/utils/app_colors.dart';
import 'package:breaking_bed/domain/entits/characher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;

  const CharactersDetailsScreen({required this.character, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.gray,
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                character.title,
                style: const TextStyle(
                  color: AppColor.white,
                ),
              ),
              centerTitle: true,
              background: Hero(
                tag: character.id,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: character.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: const EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                    padding: const EdgeInsetsDirectional.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        characterInfo("Name : ",character.fullName),
                        buildDivider(260.0),
                        if(character.lastName!='None')
                        characterInfo("First Name : ",character.firstName),
                        if(character.lastName!='None')
                          buildDivider(210.0),
                        characterInfo("Last Name : ",character.lastName),
                        buildDivider(210.0),
                        characterInfo("Family : ",character.family),
                        buildDivider(250.0),
                        if(character.lastName!='None')
                          SizedBox(height: MediaQuery.of(context).size.height*.6,),
                        if(character.lastName=='None')
                          SizedBox(height: MediaQuery.of(context).size.height*.68,),
                      ],
                    ),
                  ),
                ]
              ),
          ),
        ],
      ),
    );
  }


  Widget characterInfo(String title,String value)=>RichText(
    maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(text: title,
          style: const TextStyle(
            color: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
          TextSpan(text: value,
          style: const TextStyle(
            color: AppColor.white,
            fontSize: 16,
          )),
        ],
      ),

  );
  Widget buildDivider(double endSize)=>Divider(
    endIndent: endSize,
    thickness: 2,
    height: 30.0,
    color: AppColor.primary,);

}
