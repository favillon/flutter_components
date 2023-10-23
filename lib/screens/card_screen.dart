import 'package:flutter/material.dart';

import 'package:flutter_components/widgets/widgets.dart';


class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body:  ListView(
        padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),
        children:const [
          CustomCard(),
          SizedBox( height: 20),
          CustomCardTwo(titleImage: 'Lago',  imageUrl: 'https://images.pexels.com/photos/620337/pexels-photo-620337.jpeg'),
          SizedBox( height: 20),
          CustomCardTwo(imageUrl: 'https://blog.nzibs.co.nz/wp-content/uploads/2020/02/Landscape-1280x640.jpg',),
          SizedBox( height: 20),
          CustomCardTwo(titleImage: 'Arcoiris', imageUrl: 'https://images.squarespace-cdn.com/content/v1/59ef2d3c9f8dce981401a30d/1592002341643-UCT10ZFLQ5GCJU8L1OVY/colorful+landscapes.jpg',),
          
        ],
      )
    );
  }
}