import 'dart:math';
import 'package:flutter/material.dart';

class JokenpoScreen extends StatefulWidget {
  @override
  _JokenpoState createState() => _JokenpoState();
}

class _JokenpoState extends State<JokenpoScreen> {
  String resultado = ''; // Resultado do jogo
  String escolhaUsuario = ''; // Escolha do jogador
  String escolhaComputador = ''; // Escolha do computador

  // Função para determinar o vencedor
  void jogar(String escolha) {
    final random = Random();
    final opcoes = ['Pedra', 'Papel', 'Tesoura'];

    // A escolha do usuário é armazenada
    escolhaUsuario = escolha;

    // A escolha do computador é aleatória
    escolhaComputador = opcoes[random.nextInt(3)];

    // Lógica para determinar o vencedor
    if (escolhaUsuario == escolhaComputador) {
      resultado = 'Empate!';
    } else if ((escolhaUsuario == 'Pedra' && escolhaComputador == 'Tesoura') ||
        (escolhaUsuario == 'Papel' && escolhaComputador == 'Pedra') ||
        (escolhaUsuario == 'Tesoura' && escolhaComputador == 'Papel')) {
      resultado = 'Você Ganhou!';
    } else {
      resultado = 'Você Perdeu!';
    }

    // Atualiza o estado da UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpô'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Texto para exibir a escolha do jogador e do computador
          Text(
            'Escolha: $escolhaUsuario',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Computador: $escolhaComputador',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          // Resultado do jogo
          Text(
            resultado,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Botões para o jogador escolher Pedra, Papel ou Tesoura
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => jogar('Pedra'),
                child: Text('Pedra'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => jogar('Papel'),
                child: Text('Papel'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => jogar('Tesoura'),
                child: Text('Tesoura'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
