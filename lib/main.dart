// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // ============ this is fuction which return & show error in console =======
  void validate()
  {
    if(formkey.currentState!.validate()){
      print('ok');
    }
    else {
        print('error');
    }
  }
  // ============ this is fuction which return & show error in device =======
 String ?textValidate(value){
    if(value.isEmpty){
      return 'from khali mat rakho';
    }
    else if(value.length <6){
      return '6 char reqied';
    }
    else
      {
        return null;
      }
 }

  final TextEditingController pass=TextEditingController();
  final TextEditingController pass2= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Form(  // for form validation we use this form function.
            key: formkey, //this is key that we have declare above.
           autovalidateMode: AutovalidateMode.always, //this filed used for auto validation
            child: Column(
              children: [
                // ==============================input field for Text ==========================
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('name'),
                    border: OutlineInputBorder(),
                  ),
                  validator: textValidate, // this propety we use from TextFormField for validation
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),

                // ==============================input field for Emial ==========================
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(),
                  ),
                  // validator: EmailValidator(errorText: 'not valid'), // this propety we use from third party plugin
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'required'),
                    EmailValidator(errorText: 'not valid')
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),

                // ==============================input field for password ==========================
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('password'),
                    border: OutlineInputBorder(),
                  ),
                  // validator: EmailValidator(errorText: 'not valid'), // this propety we use from third party plugin
                    controller: pass,
                    validator: (val)
                    {
                      if(val!.isEmpty){
                        return 'passwod dalo';
                      }
                      else{
                        return null;
                      }
                    }
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),

                // ==============================input field for confirm password ==========================
                TextFormField(
                    decoration: InputDecoration(
                      label: Text('password'),
                      border: OutlineInputBorder(),
                    ),
                    // validator: EmailValidator(errorText: 'not valid'), // this propety we use from third party plugin
                    controller: pass2,
                    validator: (val)
                    {
                      if(val!.isEmpty){
                        return 'passwod dalo';
                      }
                      if(val != pass.text){
                        return 'not match';
                      }
                      else{
                        return null;
                      }
                    }
                ),

                // ==============================Submit button =================================
                Padding(
                    padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(onPressed: (){
                    validate();
                  },
                  child: Text('click'),),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
