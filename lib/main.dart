import 'package:flutter/material.dart';

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
    else
      {
        return null;
      }
 }


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
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(),
                  ),
                  validator: textValidate, // this propety we use from TextFormField for validation


                ),
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
