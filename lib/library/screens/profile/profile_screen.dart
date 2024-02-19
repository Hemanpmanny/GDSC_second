import 'package:flutter/material.dart';
import 'package:groupchat/library/screens/profile/sections/bio_section.dart';
import 'package:groupchat/library/screens/profile/sections/level_progress_section.dart';
import 'package:groupchat/library/screens/profile/sections/statis_section.dart';
import 'package:groupchat/library/widgets/keep_reading_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 200, 207, 212),
        title: Text(
          "Profile 👤",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 16.0),
              BioSection(),
              SizedBox(height: 16.0),
              LevelProgressSection(),
              SizedBox(height: 16.0),
              StatisSection(),
              SizedBox(height: 16.0),
              KeepReadingSection(),
            ],
          ),
        ),
      ),
    );
  }
}
