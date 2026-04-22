import 'package:flutter/material.dart';
import '../../models/game_result.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const List<GameResult> listMaqueta = [
    GameResult(date: '10 Abr', timeSpent: '01:20', isVictory: true, difficulty: 'Fácil'),
    GameResult(date: '09 Abr', timeSpent: '04:45', isVictory: false, difficulty: 'Difícil'),
    GameResult(date: '08 Abr', timeSpent: '02:10', isVictory: true, difficulty: 'Medio'),
    GameResult(date: '07 Abr', timeSpent: '01:38', isVictory: false, difficulty: 'Medio'),
    GameResult(date: '06 Abr', timeSpent: '00:52', isVictory: false, difficulty: 'Difícil'),
    GameResult(date: '05 Abr', timeSpent: '03:12', isVictory: true, difficulty: 'Difícil'),
    GameResult(date: '04 Abr', timeSpent: '00:59', isVictory: true, difficulty: 'Fácil'),
  ];

  Widget gameResultUI(GameResult game) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fecha: ${game.date}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final game = listMaqueta[index];
          return gameResultUI(game);
        },
        itemCount: listMaqueta.length,
      ),
    );
  }
}