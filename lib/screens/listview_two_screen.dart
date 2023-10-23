import 'package:flutter/material.dart';

class ListviewTwoScreen extends StatelessWidget {

  final optionsGame = const['Megaman', 'Metal Gear',  'Super Smash'];   
  const ListviewTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Tipo 2'),
      ),
      body: ListView.separated(
          itemCount: optionsGame.length,
          itemBuilder: (context, index) =>  ListTile(
              title : Text(optionsGame[index]), 
              trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.indigo),
              onTap: () {
                
              },
            ),
          separatorBuilder:( _, __) => const Divider(), 
        )
    );
  }
}