import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/mine_cell.dart';
import '../../viewmodels/game_view_model.dart';

class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GameViewModel>();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
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
              child: Center(
                child: Text(
                  'STATUS: ${viewModel.secondsElapsed} segundos | Minas: 10',
                  style: const TextStyle(
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
              child: _gameBoard(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameBoard(GameViewModel viewModel) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: 64,
            itemBuilder: (context, index) {
              final currentCell = viewModel.cells[index];
              return MineCell(
                cell: currentCell,
                onTap: () => viewModel.revealCell(index),
              );
            },
          ),
        ),
      ),
    );
  }
}