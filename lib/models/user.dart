import 'package:wavvlength_ui_challenge/models/prompt.dart';

import 'info.dart';

class User{
  User({
    this.name = 'John Doe',
    this.age = 18,
    this.heightInCm = 63,
    this.job,
    this.education,
    this.location = '',
    this.bio = '',
    this.savedMedia = const [],
    this.instagramPhotos = const [],
    this.prompts = const [],
    this.hobbies = const [],
  });

  final String name;
  final int age;
  final double heightInCm;
  final String? job;
  final String? education;
  final String location;
  final String bio;
  final List<String> savedMedia;
  final List<String> instagramPhotos;
  final List<Prompt> prompts;
  final List<Info> hobbies;

  String get heightInFt => '${(heightInCm / 30.48).floor()}\' ${(heightInCm % 30.48).round()}"';
  String get heightInM => '${(heightInCm / 100).toStringAsFixed(2)}m';
  List<String> get videos => savedMedia.where((element) => element.contains('mp4')).toList();
  List<String> get photos => savedMedia.where((element) => element.contains('jpg' )|| element.contains('jpeg' )).toList();
}