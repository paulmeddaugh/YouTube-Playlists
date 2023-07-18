import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtubelearning/model/playlist.dart';
import 'package:youtubelearning/model/video.dart';

import '../../repository/video_repository.dart';
import '../playlists/videos_controller.dart';
import '../../utils/string_extention.dart';
import './image_container.dart';
import '../../global/constants.dart';

class VideoDetailsPage extends StatelessWidget {
  final Video videoToLoad;
  final _controller = VideosController(VideoRepository());

  VideoDetailsPage({super.key, required this.videoToLoad});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: _controller.fetchVideoDetails([videoToLoad]),
        builder: (context, snapshot) {
          final videos =
              snapshot.data; // The data returned from the future above
          if (videos == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (videos.isEmpty) {
            return const Center(
              child: Text('Video Not Found.'),
            );
          }

          final video = videos[0];

          return Scaffold(
              appBar: AppBar(
                title: Text(videoToLoad.title),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildBanner(video.thumbUrl),
                  _buildMain(context)
                  // const Padding(
                  //   padding: EdgeInsets.only(bottom: 16.0),
                  //   child: Text(
                  //     'Course Details',
                  //     style: TextStyle(
                  //         fontSize: 16.0, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // Flexible(child: Text(video.description)),
                ],
              ));
        });
  }

  Widget _buildBanner(url) {
    return Hero(
      tag: 'card-Artwork-${videoToLoad.id}',
      child: ImageContainer(
          height: 200,
          // by not specifying width, it fills the width of the screen
          url: url),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            videoToLoad.title,
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 24),
          ),
          Text(
            Constants.playlists[videoToLoad.playlistId]?.name ??
                'Playlist not found.',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Text(
            videoToLoad.description,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
