import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingUtil {
  static bool isModalShowing = false;
  // static ProgressDialog pr = ProgressDialog(Get.context, isDismissible: false);

  static void startLoading(String? label) async {
    if (isModalShowing) return;
    //await pr.show();
    EasyLoading.show(status: '$label...',maskType: EasyLoadingMaskType.black);
    isModalShowing = true;
  }

  

  static void hideLoading() async {
    //await pr.hide();
    EasyLoading.dismiss();
    isModalShowing = false;
  }
}
