import 'package:get/get.dart';

class ColorsController extends GetxController {
  int index = 0;
  List<int> colorsList = const [
    0xffAC3931,
    0xffE5D352,
    0xffD9E76C,
    0xff537D8D,
    0xff482C3D,
    0xff2596be,
    0xff9925be,
    0xff25a5be,
    0xffbe2596,
  ];
  int color = 0xffAC3931;
  changeIndex({required int i}) {
    index = i;
    color = colorsList[i];
    update();
  }
}
