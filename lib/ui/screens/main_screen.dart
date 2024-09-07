import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wavvlength_ui_challenge/constants/strings.dart';
import 'package:wavvlength_ui_challenge/ui/widgets/dismissable_card_list.dart';
import 'package:wavvlength_ui_challenge/ui/widgets/hero_photo.dart';
import 'package:wavvlength_ui_challenge/ui/widgets/info_pill.dart';
import 'package:wavvlength_ui_challenge/ui/widgets/prompt_card.dart';
import 'package:wavvlength_ui_challenge/ui/widgets/secondary_section.dart';
import 'package:wavvlength_ui_challenge/ui/widgets/section.dart';
import 'package:wavvlength_ui_challenge/ui/widgets/video_preview.dart';

import '../../models/user.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key, required this.user, required this.currentUser});

  final User user;
  final User currentUser;
  final ScrollController scrollController = ScrollController();
  final ScrollController photoScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final similarities = currentUser.hobbies
        .where((hobby) => user.hobbies.contains(hobby))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            if (user.photos.isNotEmpty)
              HeroPhoto(
                user.photos.length > 4
                    ? user.photos.getRange(0, 3).toList()
                    : user.photos,
                onLike: () {},
                onDislike: () {},
                location: user.location,
                name: user.name,
                age: user.age,
              ),
            Section(
              direction: Axis.horizontal,
              sectionTitle: '',
              spaceBetween: 0,
              children: [
                InfoPill(
                  icon: FontAwesomeIcons.ruler,
                  text: user.heightInFt,
                  isSelected: false,
                ),
                if (user.job != null)
                  InfoPill(
                    icon: Icons.work_rounded,
                    text: user.job ?? '',
                  ),
                if (user.education != null)
                  InfoPill(
                    icon: Icons.school_rounded,
                    text: user.education ?? '',
                  )
              ],
            ),
            if (similarities.isNotEmpty)
              Section(
                direction: Axis.horizontal,
                sectionTitle: similarityLabel,
                children: List.of(similarities.map(
                  (hobby) => Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: .63,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 35,
                          child: Icon(hobby.icon),
                        ),
                      ),
                      Text(hobby.name, style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ),
                )),
              ),
            const Section(
                spaceBetween: 0,
                direction: Axis.vertical,
                sectionTitle: iceBreakerLabel,
                children: [
                  DismissibleCardList(
                    children: [
                      'What is your favorite movie?',
                      'What is your favorite book?',
                      'What is your favorite food?',
                      'What is your favorite color?',
                    ],
                  ),
                ]),
            if (user.bio.isNotEmpty)
              Section(
                likable: true,
                sectionTitle: aboutLabel,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        user.bio,
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            if (user.savedMedia.length > 4)
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black87,
                child: SingleChildScrollView(
                  controller: photoScrollController,
                  child: Section(
                    direction: Axis.horizontal,
                    sectionTitle: '',
                    height: 180,
                    children: [
                      for (final media in user.savedMedia
                          .getRange(4, user.savedMedia.length - 1))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            media,
                            height: 150,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            if (user.prompts.isNotEmpty)
              for (final prompt in user.prompts)
                PromptCard(
                  prompt: prompt.prompt,
                  response: prompt.response,
                  onLike: () {},
                ),
            if(user.videos.isNotEmpty)
              VideoPreview(user.videos.first, onLike: (){}),
            if (user.instagramPhotos.isNotEmpty)
              SecondaryPhotoSection(
                sectionTitle: igPhotosLabel,
                children: user.instagramPhotos
                    .map((photo) => CircleAvatar(
                          radius: 50,
                          foregroundImage: NetworkImage(
                            photo,
                            scale: 1.0,
                          ),
                        ))
                    .toList(),
              ),
            if (user.hobbies.isNotEmpty)
              Section(
                  sectionTitle: 'Hobbies',
                  grid: true,
                  direction: Axis.horizontal,
                  spaceBetween: 0,
                  children: [
                    for (final hobby in user.hobbies)
                      InfoPill(
                        icon: hobby.icon,
                        text: hobby.name,
                        isSelected: similarities.contains(hobby),
                      ),
                  ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rectangle_stack_person_crop),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
