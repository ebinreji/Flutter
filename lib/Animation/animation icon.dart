import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedIconExample(),
    );
  }
}

class AnimatedIconExample extends StatefulWidget {
  @override
  _AnimatedIconExampleState createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),  // Animation duration
    );
  }

  @override
  void dispose() {
    _controller.dispose();  // Dispose the controller when no longer needed
    super.dispose();
  }

  void _toggleIcon() {
    setState(() {
      if (isPlaying) {
        _controller.reverse();  // Pause icon
      } else {
        _controller.forward();  // Play icon
      }
      isPlaying = !isPlaying;  // Toggle between play and pause
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Icon Example'),
      ),
      body: Center(
        child: IconButton(
          iconSize: 100.0,
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause,  // Predefined icon animation
            progress: _controller,           // Link controller progress
          ),
          onPressed: _toggleIcon,            // Toggle animation on press
        ),
      ),
    );
  }
}