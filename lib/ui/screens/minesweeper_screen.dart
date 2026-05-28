import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../widgets/mine_cell.dart';
import '../../viewmodels/game_view_model.dart';
import '../../viewmodels/settings_view_model.dart';

class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GameViewModel>();
    final settingsVM = context.watch<SettingsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscaminas'),
        actions: [
          if (viewModel.isGameOver)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                final String mensaje =
                    '¡Acabo de jugar Buscaminas Pro!\n'
                    'Dificultad: ${settingsVM.difficulty}\n'
                    'Tiempo de supervivencia: '
                    '${viewModel.secondsElapsed} segundos.\n'
                    '¡Intenta superarme!';

                Share.share(mensaje);
              },
            ),
        ],
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
                'Dificultad: ${settingsVM.difficulty} | '
                'Tamaño: ${settingsVM.gridSize}x${settingsVM.gridSize}',
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: viewModel.gridSize,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: viewModel.totalCells,
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