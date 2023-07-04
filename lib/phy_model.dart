import 'package:flutter/material.dart';

class PhyModel extends StatefulWidget {
  const PhyModel({super.key});

  @override
  State<PhyModel> createState() => _PhyModelState();
}

class _PhyModelState extends State<PhyModel> {
  bool isFlat = true;
  bool selected = false;
  double turns = 0.0;
  double size = 300;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFlat = !isFlat;
                      });
                    },
                    child: const Text("Animate model")),
                AnimatedPhysicalModel(
                  shape: BoxShape.rectangle,
                  elevation: isFlat ? 0 : 16.0,
                  color: isFlat ? Colors.red : Colors.blue,
                  shadowColor: isFlat ? Colors.black : Colors.yellow,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInCirc,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.android_outlined,
                      size: 50,
                      color: isFlat ? Colors.white : Colors.yellow,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: const Text("Animate model")),
                SizedBox(
                  height: 350,
                  width: 200,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(seconds: 2),
                        width: selected ? 200.0 : 50.0,
                        height: selected ? 50.0 : 200.0,
                        top: selected ? 50.0 : 150.0,
                        curve: Curves.easeInOutBack,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = !selected;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        turns += 1 / 4;
                      });
                    },
                    child: const Text("Rotate model")),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(seconds: 1),
                    child: const FlutterLogo(
                      size: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      size = size == 300 ? 100 : 300;
                    });
                  },
                  child: Container(
                    color: Colors.black,
                    child: AnimatedSize(
                      curve: Curves.bounceInOut,
                      duration: const Duration(seconds: 1),
                      child: FlutterLogo(
                        size: size,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
