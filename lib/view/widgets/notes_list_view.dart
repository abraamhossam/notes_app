import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/notes_contoller.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/view/views/edit_note_view.dart';
import 'package:notes_app/view/widgets/note_iteam.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
  });

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  NotesController controller = Get.find();
  @override
  void initState() {
    controller.fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<NotesController>(
      builder: (controller) {
        List<NoteModel> listData = controller.notes;
        List<NoteModel> listNotes = listData.reversed.toList();
        return Expanded(
          child: ListView.builder(
            itemCount: controller.notes.length,
            itemBuilder: (context, index) {
              return NoteIteam(
                ontap: () {
                  Get.toNamed(
                    EditNoteView.id,
                    arguments: listNotes[index],
                  );
                },
                noteModel: listNotes[index],
                controller: controller,
              );
            },
          ),
        );
      },
    );
  }
}
