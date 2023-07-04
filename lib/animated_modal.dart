import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';

class AnimModal extends StatefulWidget {
  const AnimModal({super.key});

  @override
  State<AnimModal> createState() => _AnimModalState();
}

class _AnimModalState extends State<AnimModal>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late Widget _animatedModalBarrier;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  double opacityLevel = 1.0;
  double paddingLevel = 0.0;

  @override
  void initState() {
    ColorTween colorTween = ColorTween(
      begin: Colors.orange.withOpacity(0.5),
      end: Colors.blueGrey.withOpacity(0.5),
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _colorAnimation = colorTween.animate(_animationController);
    _animatedModalBarrier = AnimatedModalBarrier(
      color: _colorAnimation,
      dismissible: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: 100,
            width: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isPressed = true;
                    });
                    _animationController.reset();
                    _animationController.forward();
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        _isPressed = false;
                      });
                    });
                  },
                  child: const Text("press"),
                ),
                if (_isPressed) _animatedModalBarrier,
              ],
            ),
          ),
          const Text("ANimated opacity"),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
                });
              },
              child: const Text("Fade off")),
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(seconds: 2),
            child: const FlutterLogo(
              size: 100,
            ),
          ),
          const Text("ANimated Padding"),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  paddingLevel = paddingLevel == 0.0 ? 40.0 : 0.0;
                });
              },
              child: const Text("Change padding")),
          AnimatedPadding(
            padding: EdgeInsets.all(paddingLevel),
            duration: const Duration(seconds: 2),
            curve: Curves.bounceInOut,
            child: Container(
              width: Get.size.width,
              height: Get.size.height * 0.3,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(paddingLevel),
                child: const Text(
                  "data",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
