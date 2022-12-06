import 'package:flutter_making_friends_app_2/models/report_model.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:get/state_manager.dart';

class ReportController extends GetxController {
  var listReport = <Report>[].obs;
  var isLoading = true.obs;
  var errorString = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchReport();
  }

  Future<void> fetchReport() async {
    var response = await ReportRepository.getAllCourse('report/getAll');
    if (response != null) {
      listReport.value = response;
      print(listReport.toString());
    }
    isLoading.value = false;
  }
}
