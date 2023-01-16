import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/screens/bottomnavbar.dart';
import 'package:note_app/screens/home.dart';
import 'package:note_app/screens/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(NoteModelAdapter().typeId)) {
    Hive.registerAdapter(NoteModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    goToGetPage();
    return const GetMaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

Future<void> goToGetPage() async {
  await Future.delayed(const Duration(seconds: 3));

  Get.off(() => NavigationPage());
}
