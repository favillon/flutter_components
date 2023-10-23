import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class CustomCardTwo extends StatelessWidget {

  final String imageUrl;
  final String? titleImage;

  const CustomCardTwo({
    super.key, 
    required this.imageUrl, 
    this.titleImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
      ),
      elevation: 20,
      shadowColor: AppTheme.primary.withOpacity(0.6),
      child: Column(
        children:[
          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 230,
            fit : BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
          if (titleImage != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: Text(titleImage!)
            )
         // Image(image: NetworkImage('https://images.pexels.com/photos/620337/pexels-photo-620337.jpeg'))
        ],
      ),
    );
  }
}