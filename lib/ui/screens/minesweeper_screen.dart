import 'package:flutter/material.dart';
import '../widgets/mine_cell.dart';
import 'package:logger/logger.dart';
import '../../models/cell_model.dart';

class MinesweeperScreen extends StatefulWidget {
  const MinesweeperScreen({super.key});

  @override
  State<MinesweeperScreen> createState() => _MinesweeperScreenState();
}

class _MinesweeperScreenState extends State<MinesweeperScreen> {
  late List<CellModel> _cells;
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    // 1. Inicializamos el estado del tablero
    _cells = List.generate(64, (i) => CellModel(index: i));
    logger.i('Lifecycle: initState() - El estado ha sido creado.');
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logger.i('Lifecycle: didChangeDependencies() - Contexto listo o dependencias cambiadas.');
  }
  // 3. ACTUALIZACIÓN: Se llama cada vez que el widget padre envía nuevos parámetros.
  @override
  void didUpdateWidget(covariant MinesweeperScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.w('Lifecycle: didUpdateWidget() - La configuración del widget ha cambiado.');
  }
  // 4. DESTRUCCIÓN: Se llama cuando el widget se elimina permanentemente (ej. al hacer Pop).
  @override
  void dispose() {
    logger.e('Lifecycle: dispose() - El estado se destruye. Liberando memoria.');
    super.dispose();
  }

  void _onCellTapped(int index) {
    setState(() {
      _cells[index].isRevealed = true; // Actualizamos el dato
    });
  }

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
              return MineCell(
                cell: _cells[index],
                onTap: () => _onCellTapped(index),
              );// Cada celda es un widget MineCell
            },
          ),
        ),
      ),
    );
  }
}