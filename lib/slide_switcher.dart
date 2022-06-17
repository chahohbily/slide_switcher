library slide_switcher;

import 'dart:async';

import 'package:flutter/material.dart';

class SlideSwitcher extends StatefulWidget {
  final List<Widget> slidersChild;
  final StreamController<int> streamController;
  final double containerHeight;
  final double containerWight;
  final List<Color> slidersColors;
  final List<LinearGradient> slidersGradients;
  final Border containerBorder;
  final Border slidersBorder;
  final double containerBorderRadius;
  final Color containerColor;
  final double
      indents; //indents between the container and the sliders (the same on all sides)

  SlideSwitcher({
    Key? key,
    required this.slidersChild,
    required this.containerHeight,
    required this.containerWight,
    required this.streamController,
    this.containerBorder = const Border(),
    this.slidersBorder = const Border(),
    this.indents = 0,
    this.slidersColors = const [],
    this.slidersGradients = const [],
    this.containerColor = Colors.white,
    this.containerBorderRadius = 1000,
  }) : super(key: key);

  @override
  _SlideSwitcherState createState() => _SlideSwitcherState();
}

class _SlideSwitcherState extends State<SlideSwitcher>
    with SingleTickerProviderStateMixin {
  late final double sliderBorderRadius;
  late final double slidersWight;
  late final double containerBorderHeight;
  late final double containerBorderWight;
  int index = 0;
  int lastIndex = 0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );
  late Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.0),
    end: const Offset(1.0, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );

  @override
  void dispose() {
    widget.streamController.close();
    super.dispose();
  }

  //todo vertical slide, check on another devices

  @override
  void initState() {
    containerBorderHeight =
        widget.containerBorder.top.width + widget.containerBorder.bottom.width;

    containerBorderWight =
        widget.containerBorder.left.width + widget.containerBorder.right.width;

    if (widget.indents != 0) {
      sliderBorderRadius =
          (widget.containerHeight - widget.indents - containerBorderWight) *
              (widget.containerBorderRadius / widget.containerHeight);

      slidersWight =
          (widget.containerWight - widget.indents * 2 - containerBorderWight) /
              widget.slidersChild.length;
    } else {
      slidersWight = (widget.containerWight - containerBorderWight) /
          widget.slidersChild.length;

      sliderBorderRadius = (widget.containerHeight - containerBorderWight) *
          (widget.containerBorderRadius / widget.containerHeight);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.containerHeight,
        width: widget.containerWight,
        decoration: BoxDecoration(
          color: widget.containerColor,
          borderRadius: BorderRadius.circular(widget.containerBorderRadius),
          border: widget.containerBorder,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: widget.indents, right: widget.indents),
              child: SlideTransition(
                position: offsetAnimation,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: widget.containerHeight -
                      widget.indents * 2 -
                      containerBorderHeight,
                  width: slidersWight,
                  decoration: BoxDecoration(
                    border: widget.slidersBorder,
                    borderRadius: BorderRadius.circular(sliderBorderRadius),
                    color: widget.slidersColors.isNotEmpty
                        ? index + 1 > widget.slidersColors.length
                            ? widget.slidersColors[0]
                            : widget.slidersColors[index]
                        : null,
                    gradient: widget.slidersGradients.isNotEmpty
                        ? index + 1 > widget.slidersGradients.length
                            ? widget.slidersGradients[0]
                            : widget.slidersGradients[index]
                        : null,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: widget.indents, right: widget.indents),
              child: Row(
                children: List.generate(
                  widget.slidersChild.length,
                  (rowIndex) => Row(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          lastIndex = index;
                          widget.streamController.sink.add(rowIndex);
                          setState(() {
                            index = rowIndex;
                          });
                          if (widget.slidersChild.length == 2) {
                            index == 1
                                ? _controller.forward()
                                : _controller.reverse();
                          } else {
                            offsetAnimation = Tween<Offset>(
                              begin: Offset(lastIndex.toDouble(), 0.0),
                              end: Offset(index.toDouble(), 0.0),
                            ).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: Curves.linear,
                              ),
                            );
                            _controller.reset();
                            _controller.forward();
                          }
                        },
                        child: Container(
                          height: widget.containerHeight,
                          width: slidersWight,
                          child: Center(
                            child: widget.slidersChild[rowIndex],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
