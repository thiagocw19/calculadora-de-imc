import 'package:flutter/material.dart';
import 'package:imccalculator/imcclass.dart';
import 'package:imccalculator/resultadoimc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  void _limparCampos() {
    _alturaController.clear();
    _pesoController.clear();
  }

  void _btnCalcularIMC() {
    try {
      double alt = double.parse(_alturaController.text);
      double pes = double.parse(_pesoController.text);

      var myImc = Imcclass(altura: alt, peso: pes);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Resultadoimc(imc: myImc)),
      );
    } catch (e) {
      _mostrarErro();
    }
  }

  void _mostrarErro() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Erro'),
            content: Text('Insira valores válidos para altura e peso.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculdadora de IMC'),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _limparCampos),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Icon(
                  Icons.calculate_outlined,
                  color: Colors.blue,
                  size: 80.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _alturaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Altura'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _pesoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Peso'),
                ),
              ),
              ElevatedButton(
                onPressed: _btnCalcularIMC,
                child: Text('Calcular IMC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
