import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../utils/utils.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({
    super.key,
    required this.width,
    required this.progress,
    required this.goal,
  });

  final double width;
  final double progress;
  final double goal;

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _animation = Tween<double>(begin: 0, end: getCurrentProgress(widget.width))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 14,
          decoration: BoxDecoration(
            color: Helper.isDarkTheme(context)
                ? progressBarColorDark
                : progressBarColorLight,
            borderRadius: BorderRadius.circular(24),
          ),
          width: widget.width * 0.8,
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              clipBehavior: Clip.hardEdge,
              height: 14,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(24),
              ),
              width: _animation.value,
            );
          },
        ),
      ],
    );
  }

  double getCurrentProgress(double width) {
    double currentProgress = (widget.progress / widget.goal) * width * 0.8;
    return currentProgress;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
