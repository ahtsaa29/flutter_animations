import 'package:flutter/material.dart';

// animated cross fade
// animated text style
class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  bool _bool = true;
  bool _first = true;
  double _fontSize = 60;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                child: Text("Animated Cross Fade"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _bool = !_bool;
                  });
                },
                child: const Text(
                  "Switch",
                ),
              ),
              AnimatedCrossFade(
                  firstChild: Image.network(
                    "https://cdn.pixabay.com/photo/2023/06/21/15/07/butterfly-8079524_1280.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  secondChild: Image.network(
                    "https://cdn.pixabay.com/photo/2023/05/30/17/20/woman-8029209_1280.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  crossFadeState: _bool
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(seconds: 2)),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
                child: Text("Animated Default Text Style"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _fontSize = _first ? 90 : 40;
                    _color = _first ? Colors.pink : Colors.blue;
                    _first = !_first;
                  });
                },
                child: const Text(
                  "change",
                ),
              ),
              AnimatedDefaultTextStyle(
                  style: TextStyle(
                    color: _color,
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  duration: const Duration(seconds: 1),
                  child: const Text("FLutter")),
            ],
          ),
        ),
      ),
    );
  }
}
