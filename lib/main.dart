import 'package:flutter/material.dart';
import 'package:password_generator/provider/password_provider.dart';
import 'package:password_generator/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PasswordProvider()),
    ],
    child: const MainApp(),
  ),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Password Generator',
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromRGBO(23, 152, 185, 100),
        brightness: Brightness.dark,
      ),
      brightness: Brightness.dark,
    ),
    initialRoute: '/home',
    routes: {
      '/home': (context) => const HomeScreen(),
    },
  );
}
