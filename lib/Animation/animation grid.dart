import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation Grid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimationGridScreen(),
    );
  }
}

class AnimationGridScreen extends StatefulWidget {
  const AnimationGridScreen({super.key});

  @override
  _AnimationGridScreenState createState() => _AnimationGridScreenState();
}

class _AnimationGridScreenState extends State<AnimationGridScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Color> colors = List.generate(6, (index) => Colors.primaries[Random().nextInt(Colors.primaries.length)]);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,//ensure ani syned with refreash state
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Grid'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Generate a random color
              Color color = colors[index].withOpacity(_controller.value);
              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Tile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}