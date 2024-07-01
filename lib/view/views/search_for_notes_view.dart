import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/search_for_notes_view_body.dart';

class SearchForNotesView extends StatelessWidget {
  const SearchForNotesView({super.key});
  static String id = "/SearchForNotesView";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SearchForNotesViewBody(),
      ),
    );
  }
}
