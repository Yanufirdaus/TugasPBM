import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

List username = <String>[];
List password = <String>[];

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  RegisterPage createState() {
    return RegisterPage();
  }
}



class RegisterPage extends State<MyCustomForm> {
  // RegisterPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orange[50],
        automaticallyImplyLeading: false,
        toolbarHeight: 250,
        title: Column(children:[
                  Text("MyBMI", style: TextStyle(fontSize: 85, color: Colors.blue[400])),
                  Text('''

Check your weight, keep your health!''', style: TextStyle(fontSize: 15, color: Colors.blue[400]))
              ]),
        
        centerTitle: true,
      ),
      
      body: Center(
        
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Text('''
            
Signup
            ''', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
            TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            Text(""),
            TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Text('''

'''),
              ElevatedButton(
                
                onPressed:(){
                  // Navigator.of(context).pushNamed("/login");
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    username.add(_username.text);
                    password.add(_password.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(username: username, password: password,), 
                      ),
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => LoginPage(password: password, username: null,),
                    //   ),
                    // );
                    // Text(_username.text);
                    // String a = toString(_username.value);
                    // child: const Text(toString(123));
                    Navigator.of(context).pushNamed("/login");
                    // final String text = _username.text;
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text(username[0])),
                    // );
                  }
              },
                child: const Text('''submit''')),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                      ),
                onPressed:(){
                  Navigator.of(context).pushNamed("/login");
                  },
                child: const Text('''Sudah memiliki akun? Login''', style: TextStyle(backgroundColor: Colors.white, color: Colors.blue))
              )
          ],)
        )
      ),
      
      //TODO : Buat tampilan register
    );
  }
}


