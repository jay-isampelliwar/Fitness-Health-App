import 'package:get/get.dart';

import '../model/foot_step_model.dart';
import '../repository/health_repository.dart';

class HomeController extends GetxController {
  final repository = HealthRepository();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  RxList<FootSteps> steps = <FootSteps>[].obs;
  Future<void> getData() async {
    steps.value = await repository.getFootSteep();
  }
}
