import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fit_app/app_theme.dart';
import 'package:google_fit_app/screens/home.dart';
import 'package:google_fit_app/screens/splash.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Health App',
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme(),
      theme: AppTheme.lightTheme(),
      home: const SplashScreen(),
    );
  }
}
