import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
 
 String cep = "";
 TextEditingController _controllerCep = TextEditingController();
 
  _recuperaCep() async{
    
    String cepAdquirido = (_controllerCep.text);
    print(cepAdquirido);
    if(cepAdquirido.length == 8){
      String url = "https://viacep.com.br/ws/${cepAdquirido}/json/";
      http.Response response;

      response = await http.get(Uri.parse(url));
      Map <String, dynamic> retorno = json.decode(response.body);
      String logradouro = retorno["logradouro"];
      String bairro = retorno["bairro"];
      String localidade = retorno["localidade"];
      
      setState(() {
        cep = "logradouro: ${logradouro}\nbairro: ${bairro}\nlocalidade: ${localidade}";
      });
    }
    else{
      setState(() {
       cep = "Cep inválido! O número deve conter 8 algorismos"; 
      });
    }

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cheque seu cep"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start ,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
             padding: EdgeInsets.only(bottom: 12, left: 50),
             child: Text("Consulta CEP",
              style: TextStyle(
                fontSize: 40,
                color: Color.fromRGBO(0 , 0, 139, 1)
              ),
             ),
           ),
           Padding(
            
             padding: EdgeInsets.only(bottom: 12),
             child: Text("Digite seu cep",
              style: TextStyle(
                fontSize: 20,
              ),
             ),
           ),
           Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Ex: 01001000",
                ),
                controller: _controllerCep,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber
              ),
              onPressed: _recuperaCep,
              child: Text("Confirmar",
                
                style: TextStyle(
                  fontSize: 25
                ),
              ),
               
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text (cep,
              style:  TextStyle(
                fontSize: 20),
              ),
            )
            
        ],),
      ),
      
    );
  }
}