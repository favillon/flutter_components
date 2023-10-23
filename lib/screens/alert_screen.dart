import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);
 
  void displayDialogAndroid(context) {    
    showDialog(
      barrierDismissible: false, // True para cerrar dialog en cualquier lugar 
      context: context, 
      builder: (context) {
      return AlertDialog(
        elevation: 5,
        title: const Text('Title dialog'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Body de la alerta'),
            SizedBox(height: 10),
            FlutterLogo(size: 100,)
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          )
        ],
      );
    });
  }
  void displayDialogIOS(context) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Title dialog'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Body de la alerta'),
              SizedBox(height: 10),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: ElevatedButton(
          child: const Text('Ver Alerta'),
          onPressed: () => Platform.isAndroid ? displayDialogAndroid(context) : displayDialogIOS(context)
         )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed:() => Navigator.pop(context)
        ),
    );
  }
}