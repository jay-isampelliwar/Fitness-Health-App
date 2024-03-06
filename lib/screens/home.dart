import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fit_app/constant/colors.dart';
import 'package:google_fit_app/utils/utils.dart';

import '../widgets/type_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.06),
            const Text(
              "Hi!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.04),
            const TypeContainer(
              goalValue: 15000,
              goalLabel: "Goal",
              progress: 12556,
              label: "Steps",
              icon: "assets/icons/footstep_icon.svg",
            ),
            SizedBox(height: height * 0.02),
            const TypeContainer(
              goalValue: 1000,
              goalLabel: "Goal",
              progress: 500,
              label: "Calories Burned",
              icon: "assets/icons/kcal_icon.svg",
            )
          ],
        ),
      ),
    );

    // return Scaffold(
    //   floatingActionButton: FloatingActionButton(onPressed: () {
    //     controller.getData();
    //   }),
    //   appBar: AppBar(title: const Text('Health Data')),
    //   body: GetX<HomeController>(
    //     builder: (controller) {
    //       if (controller.steps.isEmpty) {
    //         return const Center(
    //           child: Text("No Data Found"),
    //         );
    //       }

    //       return ListView.builder(
    //         itemCount: controller.steps.length,
    //         itemBuilder: (context, index) {
    //           return HealthCard(
    //             footSteps: controller.steps[index],
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );
  }
}



// class HealthCard extends StatelessWidget {
//   final FootSteps footSteps;
//   const HealthCard({super.key, required this.footSteps});
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.deepOrange,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             footSteps.value.toStringAsFixed(2),
//             style: const TextStyle(fontSize: 24),
//           ),
//           Text(footSteps.unit),
//           Text(
//             footSteps.dateFrom.toString(),
//           ),
//         ],
//       ),
//     );
//   }
// }
