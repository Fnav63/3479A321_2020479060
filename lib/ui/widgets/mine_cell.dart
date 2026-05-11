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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          border: Border.all(
            color: theme.colorScheme.outline,
            width: 1.5,
          ),
        ),
        child: Center(
          child: cell.isRevealed ? Image.asset('assets/icons/mine.png', width: 24, height: 24, fit: BoxFit.contain): const SizedBox.shrink(),
        ),
      ),
    );
  }
}