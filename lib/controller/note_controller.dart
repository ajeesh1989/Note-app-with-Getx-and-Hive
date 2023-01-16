import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/note_model.dart';

class NoteController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  NoteController() {
    reachNote();
  }
  final hiveNoteName = 'hivenoteName';
  List<NoteModel> noteList = [];

  //insert to db
  Future<void> insertNote(NoteModel model) async {
    final noteDB = await Hive.openBox<NoteModel>(hiveNoteName);
    await noteDB.put(model.id, model);
    log('note added successfully');
    reachNote();
  }

  //get datas
  Future<List<NoteModel>> getNote() async {
    final noteDB1 = await Hive.openBox<NoteModel>(hiveNoteName);
    return noteDB1.values.toList();
  }

  //recieve datas
  Future<void> reachNote() async {
    noteList.clear();
    final getallNotes = await getNote();
    noteList.addAll(getallNotes);
    update();
    log("Get note successfully");
  }

  //update datas
  Future<void> updateNote(int index, NoteModel oldModel) async {
    titleController.text = oldModel.title;
    descriptionController.text = oldModel.description;
    final noteDBupdate = await Hive.openBox<NoteModel>(hiveNoteName);
    noteDBupdate.putAt(index, oldModel);

    reachNote();
  }

  //delete datas
  Future<void> deleteNote(int index) async {
    final noteDelete = await Hive.openBox<NoteModel>(hiveNoteName);
    noteDelete.deleteAt(index);
    reachNote();
    log('deleted');
  }
}
