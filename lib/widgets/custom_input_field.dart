import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    super.key, 
    this.hintText, 
    this.labelText, 
    this.helperText, 
    this.icon, 
    this.suffixIcon, 
    this.prefixIcon, 
    this.keyboardType, 
    this.obscureText = false, 
    required this.formProperty,
    required this.formValues
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      initialValue: '',
      keyboardType: keyboardType,
      obscureText: obscureText,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        formValues[formProperty] = value;
        print(value);
      },
      validator: (value) {
        if (value == null) return 'Campo Requerido';
        return value.length < 3 ? 'Minimo 3 letras' : null; 
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText:  '3 Caracteres',
        icon: icon ==null ? null : Icon(icon),
        prefixIcon: prefixIcon ==null ? null : Icon(prefixIcon),
        suffixIcon: suffixIcon ==null ? null : Icon(suffixIcon),
        /*border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10)
          )
        )*/
      ),
    );
  }
}