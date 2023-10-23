import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/custom_input_field.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey =GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'first':'',
      'last':'',
      'email':'',
      'pass':'',
      'role' :'',
    };

    return Scaffold(
      appBar: AppBar(
        title:const Text('Inputs'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children:[
                CustomInputField(labelText: 'Name', hintText: 'Nombre usuario', icon: Icons.supervisor_account_outlined, formProperty: 'first', formValues: formValues),
                const SizedBox(height: 30),
                CustomInputField(labelText: 'Apellido', hintText: 'Apellido usuario', icon: Icons.label_sharp, formProperty: 'last', formValues: formValues),
                const SizedBox(height: 30),
                CustomInputField(labelText: 'Email', hintText: 'Email usuario', icon: Icons.email_rounded, keyboardType: TextInputType.emailAddress, formProperty: 'email', formValues: formValues),
                const SizedBox(height: 30),
                CustomInputField(labelText: 'Clave', hintText: 'Clave usuario', icon: Icons.password, obscureText: true, formProperty: 'pass', formValues: formValues),
                const SizedBox(height: 30),

                DropdownButtonFormField<String>(
                  icon: const Icon(Icons.rocket_sharp),
                  value: 'Admin',
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'SuperUser', child: Text('SuperUser')),
                    DropdownMenuItem(value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem(value: 'Jr', child: Text('Jr'))
                  ], 
                  onChanged: (value){
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  }
                ),
          
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar'))
                  ),
                  onPressed:() {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!myFormKey.currentState!.validate()) {
                      print('Formulario no valido');
                      return;
                    }
                    print(formValues);
                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}