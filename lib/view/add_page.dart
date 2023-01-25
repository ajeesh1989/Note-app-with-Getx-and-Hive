import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/view/bottomnavbar.dart';

// ignore: camel_case_types
class AddPage extends StatelessWidget {
  AddPage({super.key});
  final titlecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final noteController = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Add your notes'),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: Text('data'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
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
                  controller: titlecontroller,
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
                  controller: descriptioncontroller,
                  decoration: const InputDecoration(
                    hintText: 'Enter your description',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'Success',
                    'Saved your note successfully',
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.grey.shade900,
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                  );

                  if (formkey.currentState!.validate()) {
                    addToDB();
                  }
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
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addToDB() async {
    final userTitle = titlecontroller.text.trim();
    final userDescription = descriptioncontroller.text.trim();

    final noteModeluser =
        NoteModel(title: userTitle, description: userDescription);
    noteController.insertNote(noteModeluser);
    Get.off(() => NavigationPage());
  }
}
