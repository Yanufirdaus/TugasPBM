import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.username, required this.uindex});
  final username;
  final uindex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _beratbadan = TextEditingController();
  final TextEditingController _tinggibadan = TextEditingController();
  double _bmi = 0;
  String kondisi = "";

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //TODO : bikin tampilan UI
        appBar: AppBar(
          
          backgroundColor: Colors.orange[50],
          automaticallyImplyLeading: false,
          toolbarHeight: 250,
          title: Column(children:[
                    
                    Text('Selamat Datang, ' + username[uindex], style: TextStyle(fontSize: 20, color: Colors.blue[400])),
                    Text('''

Yuk Hitung Body Mass Index mu Disini!''', style: TextStyle(fontSize: 15, color: Colors.blue[400]))
                ]),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 150),
              child: GestureDetector(
                onTap: () {},
                child: IconButton(
                  // Icons.logout,
                  color: Colors.red[800],
                  iconSize: 26.0, onPressed: () { Navigator.of(context).pushNamed("/login"); }, 
                  icon: Icon(Icons.logout), 
                ),
              )
            ),],
          
          centerTitle: true,
        ),
        body: Center(
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Text('''


Isikan berat badan dan Tinggi mu di bawah!

''', style: TextStyle(fontWeight: FontWeight.w600)),
            
            TextFormField(
                controller: _beratbadan,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Berat Badan (Kg)",
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
                controller: _tinggibadan,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Tinggi Badan (cm)",
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
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text('username atau password salah')));
                  int bb = int.parse(_beratbadan.text);
                  int tb = int.parse(_tinggibadan.text);
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      double bmi_counter = (bb/((tb/100)*(tb/100)));
                      _bmi = bmi_counter;
                      if (bmi_counter < 18.5){
                        kondisi = "Kekurang Berat Badan";
                      }
                      else if (18.5 <= bmi_counter && bmi_counter < 25){
                        kondisi = "Normal";
                      }
                      else if (25.0 <= bmi_counter && bmi_counter < 30){
                        kondisi = "Kelebihan Berat Badan";
                      }
                      else if (bmi_counter >= 30){
                        kondisi = "Obesitas";
                      }
                    });
                    // Navigator.of(context).pushNamed("/login");
                  }
                },
                child: const Text("Hitung")),
                Text('''
'''),
                
                Text("BMI : " + double.parse((_bmi).toStringAsFixed(2)).toString(), style: TextStyle(fontWeight: FontWeight.w700)),
                Text(kondisi, style: TextStyle(fontWeight: FontWeight.w900)),
               
                ],
              ),
            )
          
      ),
      
        );
  }
}
