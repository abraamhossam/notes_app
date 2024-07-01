import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/controller/colors_controller.dart';
import 'package:notes_app/controller/notes_contoller.dart';
import 'package:notes_app/helper/size_config.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/view/widgets/colors_list_view.dart';
import 'package:notes_app/view/widgets/custom_button.dart';
import 'package:notes_app/view/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final NotesController controller = Get.find();
  final ColorsController colorController = Get.find();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        width: SizeConfig.width,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.height! * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: CustomTextField(
                    text: "Title",
                    onsaved: (value) {
                      title = value;
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height! * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: CustomTextField(
                    text: "Content",
                    onsaved: (value) {
                      subTitle = value;
                    },
                    maxLines: 5,
                  ),
                ),
                ColorsListView(
                  colors: colorsList,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: CustomButton(
                    text: "Add",
                    onpressed: () {
                      var currentDate =
                          DateFormat.yMMMMd('en_US').format(DateTime.now());
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        controller.addNote(
                          model: NoteModel(
                            title: title!,
                            subTitle: subTitle!,
                            date: currentDate.toString(),
                            color: colorController.color,
                          ),
                        );
                        controller.fetchAllNotes();
                        colorController.index = 0;

                        Get.back();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(
                          () {},
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height! * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
