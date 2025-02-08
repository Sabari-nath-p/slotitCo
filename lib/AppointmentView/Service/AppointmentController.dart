import 'package:get/get.dart';
import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';

class AptController extends GetxController {
  double calculatePrice(
      {required List<ShopServiceModel> model, bool isActual = false}) {
    double price = 0;
    for (ShopServiceModel md in model) {
      if (md != null) {
        if (!isActual) {
          price = price + double.parse(md.charge!);
        } else {
          price = price + double.parse(md.strikeThroughCharge!);
        }
      }
    }

    return price;
  }
}
