import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Slider & Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            activeColor: AppTheme.primary,
            divisions: 10,
            min: 50,
            max: 400,
            value: _sliderValue,
            onChanged: _sliderEnable  ? 
              (value) {
                _sliderValue = value;
                setState(() {});
              }
            :
              null
          ),

          Checkbox(
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value ?? true;
              setState(() {});
            }
          ),
          Switch(value: _sliderEnable, onChanged:  (value) => setState(() {_sliderEnable = value;})),
          CheckboxListTile(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnable, 
            onChanged: (value) => setState(() {_sliderEnable = value ?? true;})
          ),
          SwitchListTile.adaptive(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnable, 
            onChanged:  (value) => setState(() {_sliderEnable = value;})
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage('https://w7.pngwing.com/pngs/236/836/png-transparent-gal-gadot-as-wonder-woman-gal-gadot-diana-prince-wonder-woman-batman-empire-wonder-woman-dc-comics-fictional-character-dc-extended-universe.png'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
          
        ],
      )
    );
  }
}