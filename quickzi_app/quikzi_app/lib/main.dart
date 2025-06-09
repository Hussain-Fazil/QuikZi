import 'package:flutter/material.dart';
import 'package:quikzi_app/screens/login_screen.dart';
import 'package:quikzi_app/screens/register_screen.dart';
import 'package:quikzi_app/screens/Homepage.dart';

void main() {
  runApp(const QuikZiApp());
}

class QuikZiApp extends StatefulWidget {
  const QuikZiApp({super.key});

  @override
  State<QuikZiApp> createState() => _QuikZiAppState();
}

class _QuikZiAppState extends State<QuikZiApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: const Color(0xFF4C53A5),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Color(0xFF4C53A5)),
            ),
            cardColor: const Color(0xFFF5F5F5),
            iconTheme: const IconThemeData(color: Color(0xFF4C53A5)),
            hintColor: Colors.grey,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.black),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: const Color(0xFF90CAF9),
            scaffoldBackgroundColor: const Color(0xFF121212),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1E1E1E),
              iconTheme: IconThemeData(color: Color(0xFF90CAF9)),
            ),
            cardColor: const Color(0xFF1E1E1E),
            iconTheme: const IconThemeData(color: Color(0xFF90CAF9)),
            hintColor: Colors.grey,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
            ),
          ),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/login',
          routes: {
            '/login': (_) =>
                LoginScreen(toggleTheme: toggleTheme, isDark: isDark),
            '/register': (_) => const RegisterScreen(),
            '/home': (_) => Homepage(toggleTheme: toggleTheme, isDark: isDark),
          },
        );
      },
    );
  }
}
