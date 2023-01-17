import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/screens/add_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/screens/update_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final noteRunner = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.school),
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'S C R I B B L E S',
          style: GoogleFonts.amarante(),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20), child: Text('data')),
      ),
      body: GetBuilder<NoteController>(
        builder: (controller) => noteRunner.noteList.isEmpty
            ? const Center(
                child: Text(
                  'No data',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : SafeArea(
                child: GetBuilder<NoteController>(
                  builder: (controller) => ListView.separated(
                      itemBuilder: (context, index) {
                        return Slidable(
                          startActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                backgroundColor: Colors.grey.shade700,
                                icon: Icons.edit_note_outlined,
                                label: 'Edit',
                                onPressed: ((context) {
                                  Get.to(() => UpdateNote(
                                        index: index,
                                        model: noteRunner.noteList[index],
                                      ));
                                  noteRunner.updateNote(
                                      index, noteRunner.noteList[index]);
                                }),
                              ),
                              SlidableAction(
                                backgroundColor: Colors.grey.shade900,
                                autoClose: true,
                                icon: Icons.delete,
                                label: 'Delete',
                                onPressed: ((context) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text(
                                          "Do you want to delete this category?"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () async {
                                            noteRunner.deleteNote(index);
                                            Get.back();
                                            Get.snackbar(
                                              'Done',
                                              'Note deleted successfully',
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              colorText: Colors.white,
                                              backgroundColor:
                                                  Colors.grey.shade900,
                                              icon: const Icon(
                                                Icons.delete_rounded,
                                                color: Colors.white,
                                              ),
                                            );
                                          },
                                          child: const Text("Yes"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text("No"),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              )
                            ],
                          ),
                          child: CustomCard(
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.menu_book_sharp,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    noteRunner.noteList[index].title,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    noteRunner.noteList[index].description,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                )),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: noteRunner.noteList.length),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade900,
        onPressed: () {
          Get.off(AddPage());
        },
        elevation: 3,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
