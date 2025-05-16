import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imccalculator/imcclass.dart';

class Resultadoimc extends StatefulWidget {
  final Imcclass imc;
  Resultadoimc({required this.imc});

  @override
  _ResultadoimcState createState() => _ResultadoimcState(imc);
}

class _ResultadoimcState extends State<Resultadoimc> {
  final Imcclass _imc;
  late Color _corFaixa;

  _ResultadoimcState(this._imc) {
    _corFaixa = _definirCor(_imc.faixa);
  }

  Color _definirCor(FaixaIMC faixa) {
    switch (faixa) {
      case FaixaIMC.AbaixoIdeal:
        return Colors.green;
      case FaixaIMC.PesoIdeal:
        return Colors.blue;
      case FaixaIMC.AcimaIdeal:
        return Colors.orange;
      case FaixaIMC.ObesidadeI:
        return Colors.orangeAccent;
      case FaixaIMC.ObesidadeII:
        return Colors.red;
      case FaixaIMC.ObesidadeIII:
        return Colors.deepPurple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do IMC'),
        backgroundColor: _corFaixa,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: _corFaixa, width: 9),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _imc.imc.toStringAsPrecision(3),
                  style: GoogleFonts.caladea(fontSize: 90),
                ),
                const SizedBox(height: 10),
                Text(
                  'Classificação:',
                  style: TextStyle(fontSize: 16, color: _corFaixa),
                ),
                Text(
                  _imc.faixa.descricao,
                  style: TextStyle(fontSize: 20, color: _corFaixa),
                ),
                const SizedBox(height: 30),
                const Text(
                  'O seu IMC indica se você possui o peso ideal, se '
                  'está acima ou abaixo do peso. Lembre-se que uma boa alimentação '
                  'e exercícios físicos regulares são fundamentais para '
                  'manter uma boa saúde. ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
