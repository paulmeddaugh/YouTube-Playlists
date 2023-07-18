import 'package:flutter/material.dart';
import 'package:youtubelearning/global/strings.dart';
import 'package:youtubelearning/youtube_learning_app.dart';

void main() => runApp(MaterialApp(
    title: Strings.appTitle,
    theme: ThemeData(primaryColor: Colors.red.shade400),
    home: const YoutTubeLearningApp()));
