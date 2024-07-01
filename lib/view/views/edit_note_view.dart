import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/view/widgets/edit_not_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
  static String id = "/EditNoteView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: EditNoteViewBody(
          modelData: Get.arguments,
        ),
      ),
    );
  }
}
