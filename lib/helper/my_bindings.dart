import 'package:get/get.dart';
import 'package:notes_app/controller/colors_controller.dart';
import 'package:notes_app/controller/notes_contoller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(NotesController());
    Get.put(ColorsController());
  }
}
