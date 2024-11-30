import 'package:flutter/material.dart'; // Import the Flutter material package

void main() {
  runApp(MyApp()); // Entry point of the Flutter application, runs MyApp widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List', // Title of the application
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 7, 118, 173), // Primary color of the theme
        brightness: Brightness.dark, // Set the brightness to dark mode
        fontFamily: 'OpenSans', // Set the default font family
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold), // Style for large headlines
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Style for large titles
          bodyLarge: TextStyle(fontSize: 18), // Style for large body text
          bodyMedium: TextStyle(fontSize: 14), // Style for medium body text
        ),
        colorScheme: ColorScheme.dark(
          primary: Color.fromARGB(255, 141, 0, 201), // Primary color in the dark color scheme
          secondary: Color.fromARGB(255, 183, 131, 239), // Secondary color in the dark color scheme
        ),
      ),
      home: HomeScreen(), // Set the home screen of the application
    );
  }
}