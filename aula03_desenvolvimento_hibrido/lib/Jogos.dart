import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("Imagens/opcao.png");
  var _mesagem = "Escolha sua opção!!";
  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["cara", "coroa"];
    var numero = Random().nextInt(2);
    var escolhaApp = opcoes[numero];
    switch (escolhaApp) {
      case "cara":
        setState(() {
          this._imageApp = AssetImage("Imagens/cara260.png");
        });
        break;
      case "coroa":
        setState(() {
          this._imageApp = AssetImage("Imagens/coroa260.png");
        });
        break;
    }
    if (escolhaUsuario == escolhaApp) {
      setState(() {
        this._mesagem = "Parabéns você ganhou !!";
      });
    } else {
      setState(() {
        this._mesagem = "Você perdeu :-(";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cara ou Coroa"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 32,
              bottom: 20,
            ),
            child: Text(
              "Escolha do App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: this._imageApp,
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 20),
            child: Text(
              this._mesagem,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    _opcaoSelecionada("cara");
                  },
                  child: Image.asset(
                    "Imagens/cara260.png",
                    height: 100,
                  )),
              GestureDetector(
                  onTap: () {
                    _opcaoSelecionada("coroa");
                  },
                  child: Image.asset(
                    "Imagens/coroa260.png",
                    height: 100,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
