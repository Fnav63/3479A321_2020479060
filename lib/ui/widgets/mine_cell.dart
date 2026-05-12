import 'package:flutter/material.dart';
import '../../models/cell_model.dart';

class MineCell extends StatelessWidget {
  final CellModel cell; // Recibe el estado de esta celda específica
  final VoidCallback onTap; // Recibe la función que debe ejecutar al ser tocada

  const MineCell({
    super.key,
    required this.cell,
    required this.onTap,
  });

    Widget _buildCellContent() {
    if (!cell.isRevealed) {
      return const SizedBox.shrink();
    }
    if (cell.isBomb) {
      return Image.asset(
        'assets/icons/mine.png',
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      );
    }
    return Text(
      '${cell.index}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cell.isRevealed
              ? (cell.isBomb ? Colors.red[200] : Colors.grey[300])
              : theme.colorScheme.secondary,
          border: Border.all(
            color: theme.colorScheme.outline,
            width: 1.5,
          ),
        ),
        child: Center(
          child: _buildCellContent(),
        ),
      ),
    );
  }
}