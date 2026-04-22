import 'package:flutter/material.dart';
import '../../models/game_result.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GameResult game = GameResult(
      date: '10 Abr',
      timeSpent: '01:20',
      isVictory: true,
      difficulty: 'Fácil',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial (Maqueta)'),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Fecha: ${game.date}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Tiempo: ${game.timeSpent}'),
                Text('Dificultad: ${game.difficulty}'),
                const SizedBox(height: 8),
                Text(
                  game.isVictory ? 'Victoria' : 'Derrota',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: game.isVictory ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}