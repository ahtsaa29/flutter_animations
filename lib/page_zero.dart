import 'package:flutter/material.dart';
import 'dart:math' as math;

// animated builder
class PageZero extends StatefulWidget {
  const PageZero({super.key});

  @override
  State<PageZero> createState() => _PageZeroState();
}

class _PageZeroState extends State<PageZero> with TickerProviderStateMixin {
  bool _isPlay = true;
  int count = 0;
  late AnimationController _iconController;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _iconController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              child: const FlutterLogo(
                size: 100,
              ),
              builder: (BuildContext context, Widget? child) {
                // rotate -------------------------
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );

                // scale -------------------------
                // return Transform.scale(
                //   scale: _controller.value * math.pi,
                //   child: child,
                // );

                // translate ---------------------
                // return Transform.translate(
                //   offset: Offset(100, 30),
                //   child: child,
                // );
              },
            ),
          ),
          // animated icon
          const SizedBox(
            height: 10,
          ),
          const Text('Animated Icon'),

          GestureDetector(
            onTap: () {
              if (_isPlay == false) {
                _iconController.forward();
                _isPlay = true;
              } else {
                _iconController.reverse();
                _isPlay = false;
              }
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _iconController,
              size: 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Animated List'),
          AnimatedSwitcher(
            duration: const Duration(
              seconds: 1,
            ),
            child: Text(
              "$count",
              style: const TextStyle(fontSize: 40),
              key: ValueKey(count),
            ),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}
