import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'About - S C R I B B L E S',
          style: GoogleFonts.amarante(),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20), child: Text('')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: const [
            Text(
              'Note-taking is the process of capturing information from a source or event. This usually takes the form of recording, writing, jotting, paraphrasing, sketching, labelling, outlining, and annotating. Note-taking applications enable users to type, write on their devices just as they would on paper. Many applications have their own unique features, storage, organization, and sharing capabilities, and it’s up to the user to identify which note-taking application will work best for their needs.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 310,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              'version 1.0.0',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
