import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/notes_contoller.dart';
import 'package:notes_app/helper/size_config.dart';
import 'package:notes_app/view/views/search_for_notes_view.dart';
import 'package:notes_app/view/widgets/custom_app_bar.dart';
import 'package:notes_app/view/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    NotesController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.height! * 0.03,
          ),
          CustomAppBar(
            text: "Notes",
            icon: Icons.search,
            onpressed: () {
              controller.search.value = [];
              Get.toNamed(
                SearchForNotesView.id,
              );
            },
          ),
          SizedBox(
            height: SizeConfig.height! * 0.02,
          ),
          const NotesListView(),
        ],
      ),
    );
  }
}
