// Combustível Screen
import 'package:flutter/material.dart';

class CombustivelScreen extends StatelessWidget {
  final TextEditingController consumoController = TextEditingController();
  final TextEditingController kilometragemController = TextEditingController();
  final TextEditingController precoGasolinaController = TextEditingController();
  final TextEditingController precoAlcoolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Combustível')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Calcule o melhor combustível para sua viagem',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: consumoController,
                decoration: InputDecoration(labelText: 'Consumo (Km/L)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: kilometragemController,
                decoration: InputDecoration(labelText: 'Kilometragem (Km)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: precoGasolinaController,
                decoration:
                    InputDecoration(labelText: 'Preço da Gasolina (R\$)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: precoAlcoolController,
                decoration: InputDecoration(labelText: 'Preço do Álcool (R\$)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  double consumo = double.tryParse(consumoController.text) ?? 0;
                  double km = double.tryParse(kilometragemController.text) ?? 0;
                  double precoGasolina =
                      double.tryParse(precoGasolinaController.text) ?? 0;
                  double precoAlcool =
                      double.tryParse(precoAlcoolController.text) ?? 0;

                  if (consumo == 0 ||
                      km == 0 ||
                      precoGasolina == 0 ||
                      precoAlcool == 0) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Erro'),
                        content: Text('Preencha todos os campos corretamente!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          )
                        ],
                      ),
                    );
                    return;
                  }

                  // Calculo do custo
                  double custoGasolina = (km / consumo) * precoGasolina;
                  double custoAlcool = (km / consumo) * precoAlcool;

                  // Verificação de melhor combustível
                  String melhorOpcao;
                  if ((precoAlcool / precoGasolina) <= 0.7) {
                    melhorOpcao = 'Melhor abastecer com Álcool!';
                  } else {
                    melhorOpcao = 'Melhor abastecer com Gasolina!';
                  }

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Resultado'),
                      content: Text(
                        'Custo com Gasolina: R\$${custoGasolina.toStringAsFixed(2)}\n'
                        'Custo com Álcool: R\$${custoAlcool.toStringAsFixed(2)}\n\n'
                        '$melhorOpcao',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        )
                      ],
                    ),
                  );
                },
                child: Text('Calcular'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
