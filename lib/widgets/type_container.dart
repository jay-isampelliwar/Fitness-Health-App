import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fit_app/utils/utils.dart';

import '../constant/colors.dart';
import 'animated_text.dart';
import 'progress_widget.dart';

class TypeContainer extends StatelessWidget {
  const TypeContainer({
    super.key,
    required this.goalValue,
    required this.goalLabel,
    required this.progress,
    required this.label,
    required this.icon,
  });

  final double goalValue;
  final String goalLabel;
  final double progress;
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      padding: EdgeInsets.all(width * 0.03),
      decoration: BoxDecoration(
        color: Helper.isDarkTheme(context)
            ? containerColorDark
            : containerColorLight,
        borderRadius: BorderRadius.circular(24),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "$label: ",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      // Animated Text widget

                      AnimatedText(goalValue: progress)
                    ],
                  ),
                  SizedBox(height: height * 0.015),
                  ProgressWidget(
                    goal: goalValue,
                    width: constraints.maxWidth,
                    progress: progress,
                  ),
                  SizedBox(height: height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Goal: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        goalValue.toStringAsFixed(0),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(width: width * 0.02),
              SvgPicture.asset(
                icon,
                color: Theme.of(context).colorScheme.onBackground,
              )
            ],
          );
        },
      ),
    );
  }
}
