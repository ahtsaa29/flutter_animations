import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_list.dart';
import 'package:flutter_animations/animated_modal.dart';
import 'package:flutter_animations/page_two.dart';
import 'package:flutter_animations/page_zero.dart';
import 'package:flutter_animations/phy_model.dart';
import 'package:get/get.dart';

// animated align
// animated container
// animated cross fade
class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  bool selected = false;
  bool selectedContainer = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Animated align"),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.grey,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: AnimatedAlign(
                      alignment:
                          selected ? Alignment.topRight : Alignment.bottomLeft,
                      duration: const Duration(seconds: 1),
                      curve: Curves.slowMiddle,
                      child: const FlutterLogo(
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Animated Container"),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedContainer = !selectedContainer;
                      });
                    },
                    child: AnimatedContainer(
                      width: selectedContainer ? 200.0 : Get.size.width,
                      height: selectedContainer ? 50.0 : 200.0,
                      color: selectedContainer ? Colors.black : Colors.red,
                      alignment: selectedContainer
                          ? Alignment.center
                          : Alignment.bottomLeft,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: const FlutterLogo(size: 100),
                    )),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  child: const Text("go page zero"),
                  onPressed: () => Get.to(const PageZero()),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  child: const Text("go page two"),
                  onPressed: () => Get.to(const PageTwo()),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  child: const Text("ANimated LIst"),
                  onPressed: () => Get.to(const AnimList()),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  child: const Text("ANimated Modal barrier"),
                  onPressed: () => Get.to(const AnimModal()),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  child: const Text("ANimated Physical model"),
                  onPressed: () => Get.to(const PhyModel()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
