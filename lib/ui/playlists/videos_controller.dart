import 'package:youtubelearning/model/playlist.dart';

import '../../repository/repository.dart';
import '../../model/video.dart';

class VideosController {
  final Repository _repository;

  VideosController(this._repository);

  Future<List<Video>> fetchPlaylist(Playlist pl) {
    return _repository.getPlaylist(pl);
  }

  Future<List<Video>> fetchPlaylists(List<Playlist> pls) {
    return _repository.getPlaylists(pls);
  }

  Future<List<Video>> fetchVideoDetails(List<Video> videos) =>
      _repository.getVideoDetails(videos);
}
