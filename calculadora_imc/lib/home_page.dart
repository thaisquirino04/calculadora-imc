import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _resultado = '';
TextEditingController _controllerPeso = TextEditingController();
TextEditingController _controllerAltura = TextEditingController();

class home_page extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<home_page> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de IMC'),),
      body: SingleChildScrollView(
        child: Column(
          children:<Widget> [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
              child: Text('Insira as informações', style: TextStyle(fontSize: 25.0, color: Colors.pink[800]),),
            ),
            criarEditText('Peso (Kg)', _controllerPeso), criarEditText('Altura (cm)', _controllerAltura),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
              child: Text(_resultado, style: TextStyle(fontSize: 25.0, color: Colors.pink[800]),),
            ),
            Container(
              height: 50.0, width: 250.0,
              color: Colors.blue[800],
              child: ElevatedButton(
                onPressed: () {

                  double? peso = double.tryParse(_controllerPeso.text);
                  double? altura = double.tryParse(_controllerAltura.text);

                  if(peso != null && altura != null) {
                    altura = altura / 100.0;
                    double _imc = (peso /  (altura * altura)).roundToDouble();
                    setState(() {
                      _resultado = 'IMC: $_imc';
                    });
                  } else {
                    setState(() {
                      _resultado = '';
                    });
                  }

                },
                child: Text('Calcular IMC'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding criarEditText(String texto, TextEditingController _controller) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: texto,
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                fontSize: 25.0, color: Colors.pink[800],
              )
            ),
          ),
        );
  }

}