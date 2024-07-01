import 'package:flutter/material.dart';
import 'package:notes_app/controller/notes_contoller.dart';
import 'package:notes_app/model/note_model.dart';

class NoteIteam extends StatelessWidget {
  const NoteIteam({
    super.key,
    this.ontap,
    required this.noteModel,
    required this.controller,
  });
  final VoidCallback? ontap;
  final NoteModel noteModel;
  final NotesController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 16,
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 24,
            left: 16,
          ),
          decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  noteModel.title,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Text(
                    noteModel.subTitle,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                trailing: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    noteModel.delete();
                    controller.fetchAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 34,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  top: 8,
                ),
                child: Text(
                  noteModel.date,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
