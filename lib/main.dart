import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/helper/my_bindings.dart';
import 'package:notes_app/helper/size_config.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/view/views/edit_note_view.dart';
import 'package:notes_app/view/views/notes_view.dart';
import 'package:notes_app/view/views/search_for_notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(
    const NotesApp(),
  );
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      initialRoute: NotesView.id,
      initialBinding: MyBindings(),
      getPages: [
        GetPage(
          name: NotesView.id,
          page: () => const NotesView(),
        ),
        GetPage(
          name: EditNoteView.id,
          page: () => const EditNoteView(),
        ),
        GetPage(
          name: SearchForNotesView.id,
          page: () => const SearchForNotesView(),
        ),
      ],
    );
  }
}
