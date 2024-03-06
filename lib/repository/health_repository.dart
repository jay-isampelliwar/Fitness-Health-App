import 'dart:developer';

import 'package:health/health.dart';
import '../model/foot_step_model.dart';

class HealthRepository {
  final health = HealthFactory();

  Future<List<FootSteps>> getFootSteep() async {
    try {
      await health.hasPermissions([HealthDataType.BODY_MASS_INDEX]);
      bool requested =
          await health.requestAuthorization([HealthDataType.BODY_MASS_INDEX]);
      if (requested) {
        List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now(),
          DateTime.now(),
          [HealthDataType.STEPS],
        );

        return healthData.map((e) {
          var b = e;
          return FootSteps(
            double.parse(b.value.toString()),
            b.unitString,
            b.dateFrom,
            b.dateTo,
          );
        }).toList();
      }
      return [];
    } on HealthException catch (e) {
      log(e.toString());
      return [];
    }
  }
}
