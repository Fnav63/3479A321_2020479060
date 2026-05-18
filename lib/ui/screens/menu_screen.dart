import 'package:flutter/material.dart';
import '../../core/services/storage_service.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var username = StorageService.getUsername();
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Pantalla de Menú, Bienvenido! $username'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/game',
                arguments: {'difficulty': 'Facil', 'gridSize': 8},
              ),
              child: const Text('Jugar'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Historial'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('Acerca de'),
            ),
          ],
        ),
      ),
    );
  }
}