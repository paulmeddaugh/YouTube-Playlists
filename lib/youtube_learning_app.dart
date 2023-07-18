import 'package:flutter/material.dart';
import 'package:youtubelearning/global/strings.dart';
import './ui/playlists/playlists_page.dart';
import 'ui/filter/filter_page.dart';

class YoutTubeLearningApp extends StatelessWidget {
  const YoutTubeLearningApp({super.key});

  /*
  TextButton(
    onPressed: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FilterPage())),
    child: const Text('Filters'),
  ),
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
        actions: <Widget>[
          IconButton(
              onPressed: () => _navToFilterPage(context),
              icon: const Icon(Icons.filter_list))
        ],
      ),
      body: const PlaylistsPage(),
    );
  }

  void _navToFilterPage(BuildContext context) {
    Navigator.of(context).push<MaterialPageRoute>(
        MaterialPageRoute(builder: (context) => const FilterPage()));
  }
}
