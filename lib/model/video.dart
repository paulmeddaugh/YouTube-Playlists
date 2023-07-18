import 'package:youtubelearning/model/playlist.dart';

import '../global/constants.dart';

class Video {
  final String id;
  final String? playlistId;
  late final String title;
  final String description;
  final String? duration;
  final String? thumbUrl;
  final String? embeddedHTML;

  Video(this.id, this.playlistId, this.title, this.description, this.duration,
      this.embeddedHTML, this.thumbUrl);

  Video.fromJson(Map<String, dynamic> json)
      : id = json['contentDetails']['videoId'] ?? json['id'] as String,
        playlistId = json['snippet']['playlistId'],
        description = json['snippet']['description'] as String,
        duration = json['contentDetails']['duration'] as String?,
        thumbUrl = json['snippet']['thumbnails']['medium']['url'] as String?,
        embeddedHTML = json['player']?['embedHtml'] as String? {
    final t = json['snippet']['title'] as String;
    title =
        (Constants.playlists[playlistId]?.name == 'Building a React Native app')
            ? t.split('Building a React Native app ')[1].substring(1).trim()
            : t;
  }

  @override
  String toString() {
    return title;
  }
}
