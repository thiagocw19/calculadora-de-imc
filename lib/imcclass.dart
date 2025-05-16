enum FaixaIMC {
  AbaixoIdeal,
  PesoIdeal,
  AcimaIdeal,
  ObesidadeI,
  ObesidadeII,
  ObesidadeIII,
}

extension FaixaIMCExt on FaixaIMC {
  String get descricao {
    switch (this) {
      case FaixaIMC.AbaixoIdeal:
        return 'Abaixo do Peso';
      case FaixaIMC.PesoIdeal:
        return 'Peso Ideal';
      case FaixaIMC.AcimaIdeal:
        return 'Acima do Peso';
      case FaixaIMC.ObesidadeI:
        return 'Obesidade Grau I';
      case FaixaIMC.ObesidadeII:
        return 'Obesidade Grau II';
      case FaixaIMC.ObesidadeIII:
        return 'Obesidade Grau III';
    }
  }
}

class Imcclass {
  final double peso;
  final double altura;

  Imcclass({required this.peso, required this.altura});

  double get imc => peso / (altura * altura);

  FaixaIMC get faixa {
    const double limiteAbaixoIdeal = 18.6;
    const double limitePesoIdeal = 24.9;
    const double limiteAcimaIdeal = 29.9;
    const double limiteObesidadeI = 34.9;
    const double limiteObesidadeII = 39.9;

    final double valueIMC = imc;

    if (valueIMC < limiteAbaixoIdeal) return FaixaIMC.AbaixoIdeal;
    if (valueIMC < limitePesoIdeal) return FaixaIMC.PesoIdeal;
    if (valueIMC < limiteAcimaIdeal) return FaixaIMC.AcimaIdeal;
    if (valueIMC < limiteObesidadeI) return FaixaIMC.ObesidadeI;
    if (valueIMC < limiteObesidadeII) return FaixaIMC.ObesidadeII;

    return FaixaIMC.ObesidadeIII;
  }
}
