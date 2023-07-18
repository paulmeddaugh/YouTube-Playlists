import 'dart:convert';

import 'package:youtubelearning/model/playlist.dart';

import '../model/video.dart';
import '../global/constants.dart';
import 'repository.dart';
import 'package:http/http.dart' as http;

class VideoRepository implements Repository {
  String basePlaylistUrl =
      'https://www.googleapis.com/youtube/v3/playlistItems';
  String baseVideosUrl = 'https://www.googleapis.com/youtube/v3/videos';

  @override
  Future<List<Video>> getPlaylist(Playlist pl) async {
    final videos = <Video>[];
    const String part = 'contentDetails,id,snippet,status';

    String url =
        '$basePlaylistUrl?part=$part&playlistId=${pl.id}&key=${Constants.apiKey}&maxResults=50';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final apiResponse = json.decode(response.body) as Map<String, dynamic>;

    final items = apiResponse['items'];
    for (var item in items) {
      videos.add(Video.fromJson(item));
    }

    return videos;
  }

  @override
  Future<List<Video>> getPlaylists(List<Playlist> playlists) async {
    final videos = <Video>[];
    for (var playlist in playlists) {
      videos.addAll(await getPlaylist(playlist));
    }

    return videos;
  }

  @override
  Future<List<Video>> getVideoDetails(List<Video> vids) async {
    final videos = <Video>[];
    // print(vids);

    if (vids.isEmpty) return videos;

    String videoIdsString = vids.map((v) => v.id).join(',');

    // final videoIdsString = 'vl_AaCgudcY';
    const String part = 'contentDetails,player,snippet';

    String url =
        '$baseVideosUrl?part=$part&id=$videoIdsString&key=${Constants.apiKey}';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final apiResponse = json.decode(response.body) as Map<String, dynamic>;

    final items = apiResponse['items'];
    for (var item in items) {
      videos.add(Video.fromJson(item));
    }

    return videos;
  }
}
