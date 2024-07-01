import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/controller/colors_controller.dart';

import 'package:notes_app/view/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/view/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  static String id = "/NotesView";

  @override
  Widget build(BuildContext context) {
    ColorsController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: kPrimaryColor,
          onPressed: () {
            controller.index = 0;
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              },
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
