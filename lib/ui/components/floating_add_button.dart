// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'dart:math' as math;

class FloatingAddButton extends StatefulWidget {
  const FloatingAddButton({Key? key, required this.options}) : super(key: key);

  final List<FloatingOptionButton> options;

  @override
  State<FloatingAddButton> createState() => _FloatingAddButtonState();
}

class _FloatingAddButtonState extends State<FloatingAddButton>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;

  late final AnimationController animationController;
  late final Animation<double> openAnimation;
  final int duration = 250;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      value: isOpen ? 1 : 0,
      duration: Duration(milliseconds: duration),
      vsync: this,
    );

    openAnimation = CurvedAnimation(
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOutQuad,
      parent: animationController,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void toggleButton() {
    setState(() {
      isOpen = !isOpen;
      if (isOpen) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: openAnimation,
        builder: (context, child) {
          return SizedBox.expand(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomRight,
              children: [
                ...widget.options.map((option) => Positioned(
                      right: 70 *
                          (openAnimation.value == 0 ? 1 : openAnimation.value),
                      bottom: (widget.options.length -
                              widget.options.indexOf(option) -
                              1) *
                          50 *
                          openAnimation.value,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: duration),
                        child: AnimatedOpacity(
                          opacity: isOpen ? 1 : 0,
                          curve: Interval(0, 1, curve: Curves.easeOut),
                          duration: Duration(milliseconds: duration),
                          child: option,
                        ),
                      ),
                    )),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: kSecondaryColor.withOpacity(0.5),
                            offset: Offset(0, 4),
                            blurRadius: 10,
                            spreadRadius: 2)
                      ]),
                  child: TextButton(
                      onPressed: toggleButton,
                      style: TextButton.styleFrom(
                        backgroundColor: kRedColor,
                        fixedSize: Size(100, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.rotate(
                            angle: openAnimation.value * math.pi / 4,
                            child: Icon(
                              Icons.add,
                              color: kWhiteColor,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          );
        });
  }
}

class FloatingOptionButton extends StatelessWidget {
  const FloatingOptionButton(
      {Key? key, required this.title, required this.onClick})
      : super(key: key);

  final String title;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 4),
        backgroundColor: kGreenColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Text(
        title,
        style: TextStyle(color: kWhiteColor, fontSize: 16, height: 1.4),
      ),
    );
  }
}
