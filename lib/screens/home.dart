import 'package:flutter/material.dart';
import 'jogos/jokenpo.dart';
import 'jogos/cara_ou_coroa.dart';
import 'jogos/jogo_da_velha.dart';

class JogosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB39DDB), // Lilás
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.apps, // Ícone representando um "App"
              size: 50,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Text(
              'Tudo em um só lugar!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 100, // Ajusta a altura da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botão Jokenpô com ícone
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JokenpoScreen()));
              },
              icon: Icon(Icons.handshake, color: Colors.white),
              label: Text('Jokenpô', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD1C4E9),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 16),
            // Botão Cara ou Coroa com ícone
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CaraOuCoroaScreen()));
              },
              icon: Icon(Icons.monetization_on, color: Colors.white),
              label: Text('Cara ou Coroa', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFCE93D8),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 16),
            // Botão Jogo da Velha com ícone
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JogoDaVelhaScreen()));
              },
              icon: Icon(Icons.grid_3x3, color: Colors.white),
              label: Text('Jogo da Velha', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE1BEE7),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFB39DDB),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'App AllinOne',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              'Sarah Aparecida Campos Silva',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Desenvolvimento Mobile CDL',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
