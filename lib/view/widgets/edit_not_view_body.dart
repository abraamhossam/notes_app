import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/notes_contoller.dart';
import 'package:notes_app/helper/size_config.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/view/widgets/custom_app_bar.dart';
import 'package:notes_app/view/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.modelData,
  });
  final NoteModel modelData;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

String? title, subTitle;
NotesController controller = Get.find();

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.height! * 0.02,
          ),
          CustomAppBar(
            text: "Edit Note",
            icon: Icons.check,
            onpressed: () {
              widget.modelData.title = title ?? widget.modelData.title;
              widget.modelData.subTitle = subTitle ?? widget.modelData.subTitle;
              widget.modelData.save();
              controller.fetchAllNotes();
              Get.back();
            },
          ),
          SizedBox(
            height: SizeConfig.height! * 0.06,
          ),
          CustomTextField(
            onchanged: (value) {
              title = value;
            },
            text: widget.modelData.title,
          ),
          SizedBox(
            height: SizeConfig.height! * 0.02,
          ),
          CustomTextField(
            onchanged: (value) {
              subTitle = value;
            },
            text: widget.modelData.subTitle,
            maxLines: 5,
          ),
          SizedBox(
            height: SizeConfig.height! * 0.04,
          ),
        ],
      ),
    );
  }
}
