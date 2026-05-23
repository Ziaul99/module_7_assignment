import 'package:flutter/material.dart';
import 'screens/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // We're keeping it clean and modern — no distracting default colors
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C3EF4)),
        useMaterial3: true,
      ),
      home: const TodoListScreen(),
    );
  }
}
