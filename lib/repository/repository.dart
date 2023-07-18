import 'package:youtubelearning/model/playlist.dart';

import '../model/video.dart';

abstract class Repository {
  Future<List<Video>> getPlaylist(Playlist pl);
  Future<List<Video>> getPlaylists(List<Playlist> pls);
  Future<List<Video>> getVideoDetails(List<Video> videoIds);
}
