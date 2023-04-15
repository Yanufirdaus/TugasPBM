import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';

int uindex = 0;

class LoginPage extends StatelessWidget {
LoginPage({super.key, required this.username, required this.password});
  final username;
  final password;
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
            
Login
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
                  List users = username;
                  uindex = users.indexOf(_username.text.toString());
                  if (uindex == -1){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('username atau password salah')),
                      );
                  }
                  // int pindex = pw.indexOf(_password.text.toString());
                  // Navigator.of(context).pushNamed("/login");
                  else if (_formKey.currentState!.validate()) {
                    if (_username.text.toString() != username[uindex].toString() || _password.text.toString() != password[uindex].toString()){
                      // return 'username atau password salah';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('username atau password salah')),
                      );
                    }
                    else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(username: username, uindex: uindex), 
                        ),
                      );
                    }
                  }
                  },
                child: const Text("submit")),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent
                        ),
                  onPressed:(){
                    Navigator.of(context).pushNamed("/register");
                    },
                  child: const Text('''Belum memiliki akun? Signup''', style: TextStyle(backgroundColor: Colors.white, color: Colors.blue))
                )
              
                
          ],)
        )
      ),
      //TODO : Buat tampilan register
    );
  }
}
