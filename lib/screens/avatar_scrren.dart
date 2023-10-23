import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stan lee'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              child: const Text('LK'),
            ),
          )
        ],
      ),
      body: const Center(
         child: CircleAvatar(
          maxRadius: 120,
          backgroundImage: NetworkImage('https://hips.hearstapps.com/hmg-prod/images/loki-1623136040.jpg'),
         )
      ),
    );
  }
}