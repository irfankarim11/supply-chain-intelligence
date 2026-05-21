import 'package:flutter/material.dart';
import 'screens/input_screen.dart';
import 'screens/insights_screen.dart';
import 'screens/action_chain_screen.dart';
import 'screens/outcome_screen.dart';
import 'models/data_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataService.loadData();
  runApp(const SupplyChainApp());
}

class SupplyChainApp extends StatelessWidget {
  const SupplyChainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supply Chain Intelligence',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A1628), // Dark Navy Blue
        primaryColor: const Color(0xFF0A1628),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF0A1628),
          secondary: Color(0xFFFF6B35), // Orange Accent
          surface: Color(0xFF152A4A), // Slightly lighter blue for cards
          error: Colors.redAccent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A1628),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6B35), // Orange Action Button
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InputScreen(),
        '/insights': (context) => const InsightsScreen(),
        '/action_plan': (context) => const ActionChainScreen(),
        '/outcome': (context) => const OutcomeScreen(),
      },
    );
  }
}
