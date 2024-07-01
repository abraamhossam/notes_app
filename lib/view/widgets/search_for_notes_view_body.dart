import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/controller/notes_contoller.dart';
import 'package:notes_app/helper/size_config.dart';
import 'package:notes_app/view/views/edit_note_view.dart';
import 'package:notes_app/view/widgets/note_iteam.dart';

class SearchForNotesViewBody extends StatelessWidget {
  const SearchForNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    NotesController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Column(
        children: [
          TextField(
            cursorColor: kPrimaryColor,
            onChanged: (value) {
              controller.searchForNotes(text: value);
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
              ),
              hintText: "Search For Notes",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  32,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  32,
                ),
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.height! * 0.02,
          ),
          GetX<NotesController>(
            builder: (controller) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.search.length,
                  itemBuilder: (context, index) {
                    return NoteIteam(
                      ontap: () {
                        Get.toNamed(
                          EditNoteView.id,
                          arguments: controller.search[index],
                        );
                      },
                      noteModel: controller.search[index],
                      controller: controller,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
