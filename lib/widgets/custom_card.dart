import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album_outlined, color: AppTheme.primary,),
            title: Text('Soy un Titulo'),
            subtitle: Text('Lorem ipsum  asdkjadjkadja'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){}, child: const Text('Cancelar')), 
                TextButton(onPressed: (){}, child: const Text('Ok'))
              ],
            ),
          )
        ],
      ),
    );
  }
}