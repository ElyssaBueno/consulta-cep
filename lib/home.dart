import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
 
  _recuperaCep(){

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chque seu cep"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite o cep",
                ),
              ),
            ),
            RaisedButton(
              onPressed: _recuperaCep,
              color: Colors.amberAccent,
              child: Text("Confirmar",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
               
            )
            
        ],),
      ),
      
    );
  }
}