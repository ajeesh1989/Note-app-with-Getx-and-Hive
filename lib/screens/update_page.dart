import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/screens/home.dart';

// ignore: must_be_immutable
class UpdateNote extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  UpdateNote({Key? key, required this.index, required this.model});
  int index;
  final NoteModel model;

  final formKey = GlobalKey<FormState>();
  final noteController = Get.put(
    NoteController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Update note'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your title';
                  } else {
                    return null;
                  }
                },
                controller: noteController.titleController,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: 'Enter your note',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your description';
                  } else {
                    return null;
                  }
                },
                controller: noteController.descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter your description',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // if (formKey.currentState!.validate()) {
                addToDB(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      "Note updated successfully.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
                // } else {
                //   return null;
                // }
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey.shade900),
              ),
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addToDB(int index) async {
    final userTitle = noteController.titleController.text.trim();
    final userDescription = noteController.descriptionController.text.trim();
    final noteModelUser =
        NoteModel(title: userTitle, description: userDescription);
    noteController.updateNote(index, noteModelUser);
    Get.off(() => HomePage());
  }
}
