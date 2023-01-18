import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/navigation_controller.dart';
import 'package:note_app/view/home.dart';
import 'package:note_app/view/about.dart';

// ignore: must_be_immutable
class NavigationPage extends StatelessWidget {
  BottomNavigationController navigationController =
      Get.put(BottomNavigationController());

  NavigationPage({super.key});

  final screen = [
    HomePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        (() => IndexedStack(
              index: navigationController.selectedIndex.value,
              children: screen,
            )),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            navigationController.changeIndex(index);
          },
          currentIndex: navigationController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.grey.shade900,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.note),
              label: 'About',
              backgroundColor: Colors.grey.shade900,
            ),
          ],
        ),
      ),
    );
  }
}
