import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: MyAppState()));
}

class MyAppState extends StatefulWidget {
  @override
  _MyAppStateState createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  var valorConta = 0.0;
  var quantiadePessoas = 0;
  var porcentagemGracom = 0.0;

  var valorPagarPorPessoa = 0.0;
  var valorPagarGacom = 0.0;
  var valorTotalPagar = 0.0;

  body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
              decoration: InputDecoration(
                  prefix: Text('R\$'), labelText: "Valor da Conta"),
              onChanged: (val) => setState(() => valorConta = double.tryParse(val) ?? 0.0)
            ),
            const SizedBox(height: 24),
            TextFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Quantidade de pessoas",
              ),
              maxLength: 3,
              onChanged: (val) => setState(() => quantiadePessoas = int.tryParse(val) ?? 0)
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}'))],
              decoration: InputDecoration(
                  suffix: Text('%'), labelText: "Porcentagem do graçom"),
              onChanged: (val) => setState(() => porcentagemGracom = double.tryParse(val) ?? 0.0)
            ),
            const SizedBox(height: 50),
            ElevatedButton(onPressed: calcular, child: const Text("Calcular")),
            Text("\nValor a pagar para o garçom: R\$" + (!valorPagarGacom.isNaN ? valorPagarGacom.toStringAsFixed(2) : "0.00")
            + "\nValor a pagar por pessoa: R\$" + (!valorPagarPorPessoa.isNaN ? valorPagarPorPessoa.toStringAsFixed(2) : "0.00")
            + "\nValor total a pagar: R\$" + (!valorTotalPagar.isNaN ? valorTotalPagar.toStringAsFixed(2) : "0.00"))
          ],
        ),
      ),
    );
  }

  calcular() {
    setState(() {
      valorPagarGacom = valorConta * porcentagemGracom;
      valorTotalPagar = (valorConta + valorPagarGacom);
      valorPagarPorPessoa = valorTotalPagar / quantiadePessoas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calcular Divisão do Valor da Conta'),
        ),
        body: body());
  }
}
