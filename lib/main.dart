import 'package:flutter/material.dart';
//import 'package:logger/logger.dart';
import 'ui/screens/minesweeper_screen.dart';
import 'ui/screens/about_screen.dart';
import 'ui/screens/history_screen.dart';
import 'ui/screens/menu_screen.dart';
import 'package:provider/provider.dart';
import 'core/services/storage_service.dart';
import 'ui/screens/settings_screen.dart';
import 'viewmodels/settings_view_model.dart';
import 'viewmodels/game_view_model.dart';


//var logger = Logger();

void main() async {
  /*logger.d('Iniciando la aplicación de Buscaminas'); // Debug
  logger.i('Iniciando la aplicación de Buscaminas'); // Info
  logger.w('Iniciando la aplicación de Buscaminas'); // Warning
  logger.e('Iniciando la aplicación de Buscaminas'); // Error*/
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(    
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsViewModel()),
      ],
      child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu',
      // Mapa centralizado de Rutas Nombradas
      routes: {
      '/menu': (context) => const MenuScreen(),
      '/game': (context) => ChangeNotifierProvider(
        create: (context) => GameViewModel(
          gridSize: context.read<SettingsViewModel>().gridSize,
        ),
        child: const MinesweeperScreen(),
      ),
      '/history': (context) => const HistoryScreen(),
      '/about': (context) => const AboutScreen(),
      '/settings': (context) => const SettingsScreen(),
      },
      title: 'Buscaminas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 212, 212, 212),
          primary: const Color.fromARGB(255, 132, 38, 209),
          secondary: const Color.fromARGB(255, 96, 159, 241),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 156, 119, 153),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
      ),
    );
  }
}
