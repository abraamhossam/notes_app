import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/model/note_model.dart';

class NotesController extends GetxController {
  RxList<NoteModel> notes =
      [NoteModel(title: "", subTitle: "", date: "", color: 0)].obs;
  RxList search = [].obs;

  addNote({required NoteModel model}) async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    await notesBox.add(model);
  }

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes.value = notesBox.values.toList();
  }

  searchForNotes({
    required text,
  }) async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    List<NoteModel> results = notesBox.values
        .where(
          (model) => model.title.contains(text),
        )
        .toList();
    if (results.isNotEmpty) {
      search.value = results;
    } else {}
  }
}
