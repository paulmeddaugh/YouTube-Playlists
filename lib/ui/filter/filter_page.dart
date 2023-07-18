import 'package:flutter/material.dart';
import 'package:youtubelearning/global/model.dart';
import '../../global/strings.dart';
import '../../global/constants.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late final PlaylistsModel _model;

  final playlists = Constants.playlists.values.toList();

  @override
  void initState() {
    super.initState();
    _model = PlaylistsModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: Center(
        child: Column(children: <Widget>[
          const Text('Building a React Native app'),
          TextButton(
              onPressed: () => _addFilter(Constants.playlists.keys.first),
              child: const Text('Remove'))
        ]),
      ),
    );
  }

  void _addFilter(String playlistId) {
    setState(() {
      _model.filteredPlaylistIds.add(playlistId);
    });
  }

  void _removeFilter(String playlistId) {
    setState(() {
      _model.filteredPlaylistIds.remove(playlistId);
    });
  }
}
