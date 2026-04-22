import 'package:flutter/material.dart';
import '../widgets/mine_cell.dart';

class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // Definimos valores por defecto (Fallback) en caso de que lleguen nulos
    final String difficulty = args?['difficulty'] ?? 'Desconocida';
    final int gridSize = args?['gridSize'] ?? 8;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscaminas'),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'STATUS: 349 segundos | Minas: 10 | Cuadros: 56',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dificultad: $difficulty | Tamaño: ${gridSize}x$gridSize',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: _gameBoard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameBoard() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: 64,
            itemBuilder: (context, index) {
              return MineCell(index: index);
            },
          ),
        ),
      ),
    );
  }
}