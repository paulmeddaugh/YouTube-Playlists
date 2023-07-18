import 'package:flutter/material.dart';
import 'package:youtubelearning/global/model.dart';
import 'package:youtubelearning/repository/video_repository.dart';
import 'package:youtubelearning/ui/video_detail/video_details_page.dart';
import '../../global/constants.dart';
import '../../model/video.dart';
import '../filter/filter_page.dart';
import 'videos_controller.dart';

class PlaylistsPage extends StatefulWidget {
  const PlaylistsPage({super.key});

  @override
  State<PlaylistsPage> createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  late final PlaylistsModel _model;
  final _controller = VideosController(VideoRepository());

  @override
  void initState() {
    super.initState();
    _model = PlaylistsModel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _controller.fetchPlaylists(Constants.playlists.values
          // Videos from a filtered playlist still show
          .where((element) => !_model.filteredPlaylistIds.contains(element.id))
          .toList()),
      builder: (context, snapshot) {
        final videos = snapshot.data; // The data returned from the future above
        if (videos == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        /*
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FilterPage())),
            child: const Text('Filters'),
          ),
        */

        // Lazily renders a list
        return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: videos.length,
            itemBuilder: (context, index) => _buildRow(videos[index]));
      },
    );
  }

  Widget _buildRow(Video video) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(children: <Widget>[
            Text(
              video.title,
              style: const TextStyle(fontSize: 14.0),
              textAlign: TextAlign.left,
            ),
            Text(
              video.description,
              style: const TextStyle(
                  fontSize: 10.0,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.grey),
            )
          ]),
        ),
        // A widget that follows after the title
        trailing: Hero(
          tag: 'card-Artwork-${video.id}',
          transitionOnUserGestures: true,
          child: ClipRRect(
            // Clips a rectangular size child widget by the specified borderRadius
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              // Loads an image from a url
              video.thumbUrl ?? '',
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoDetailsPage(videoToLoad: video),
              ));
        },
      ),
    );
  }
}
