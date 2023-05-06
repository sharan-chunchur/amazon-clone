import 'package:amazon_clone/features/auth/screen/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:amazon_clone/utils/global_variables.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          colorScheme: ColorScheme.light(primary: GlobalVariables.primary)),
      title: 'Amazon Clone',
      home: AuthScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
