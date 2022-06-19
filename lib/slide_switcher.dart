library slide_switcher;

import 'package:flutter/material.dart';

class SlideSwitcher extends StatefulWidget {
  ///Widgets that placed inside sliders
  final List<Widget> children;

  ///The function takes an index variable, which varies depending on the index of the current slider
  final void Function(int index) onSelect;

  ///Container height
  final double containerHeight;

  ///Container width
  final double containerWight;

  ///The color of each slider. A single color in the array will fill all sliders
  final List<Color> slidersColors;

  ///The gradient of each slider. A single gradient in the array will fill all sliders
  final List<LinearGradient> slidersGradients;

  ///Container border widget
  final Border containerBorder;

  ///Slider border widget
  final Border slidersBorder;

  ///Container corner rounding radius
  final double containerBorderRadius;

  ///Container fill color
  final Color containerColor;

  ///Indents between the container and the sliders (the same on all sides)
  final double indents;

  ///A class for creating sliders
  const SlideSwitcher({
    Key? key,
    required this.children,
    required this.containerHeight,
    required this.containerWight,
    required this.onSelect,
    this.containerBorder = const Border(),
    this.slidersBorder = const Border(),
    this.indents = 0,
    this.slidersColors = const [Colors.white],
    this.slidersGradients = const [],
    this.containerColor = Colors.grey,
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
              widget.children.length;
    } else {
      slidersWight = (widget.containerWight - containerBorderWight) /
          widget.children.length;

      sliderBorderRadius = (widget.containerHeight - containerBorderWight) *
          (widget.containerBorderRadius / widget.containerHeight);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: widget.slidersGradients.isEmpty
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
                widget.children.length,
                (rowIndex) => Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        lastIndex = index;
                        index = rowIndex;
                        setState(() {});
                        widget.onSelect(index);
                        if (widget.children.length == 2) {
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
                      child: SizedBox(
                        height: widget.containerHeight,
                        width: slidersWight,
                        child: Center(
                          child: widget.children[rowIndex],
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
    );
  }
}