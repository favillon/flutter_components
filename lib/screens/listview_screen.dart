import 'package:flutter/material.dart';

class ListviewScreen extends StatelessWidget {

  final optionsGame = const['Megaman', 'Metal Gear',  'Super Smash'];   
  const ListviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Tipo 1'),
      ),
      body: ListView(
        children: [
          ...optionsGame.map(
            (game) => ListTile(
              title : Text(game), 
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            )
          ).toList()          
        ],
      )
    );
  }
}