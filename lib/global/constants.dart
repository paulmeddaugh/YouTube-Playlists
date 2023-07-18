import '../model/playlist.dart';

class Constants {
  // Values from the RW API
  static const String iosDomain = '1';
  static const String androidDomain = '2';
  static const String unityDomain = '3';
  static const String macosDomain = '5';
  static const String archivedDomain = '6';
  static const String sssDomain = '8';
  static const String flutterDomain = '9';

  // Values stored in preferences
  static const int otherFilter = -1;
  static const int allFilter = 0;
  static const int iosFilter = 1;
  static const int androindFilter = 2;
  static const int unityFilter = 3;
  static const int macosFilter = 5;
  static const int sssFilter = 8;
  static const int flutterFilter = 9;

  static const String filterKey = 'FILTER_KEY';

  static const String apiKey = 'AIzaSyBzwUiTT7UX0AdnApYc6l2CCV4CYi93L9k';

  static const playlists = {
    'PLYSxLlUA2IkEUZjlxfk-ecd6kD9vJjs2b': Playlist(
        'PLYSxLlUA2IkEUZjlxfk-ecd6kD9vJjs2b',
        'Building a React Native app',
        15),
    'PLYSxLlUA2IkEskt7Nv_jiZElwq1Hb2odC': Playlist(
        'PLYSxLlUA2IkEskt7Nv_jiZElwq1Hb2odC',
        'Building a React Native App',
        15),
    'PLYSxLlUA2IkGzenb4iMi6xoyvmHUtR9X1': Playlist(
        'PLYSxLlUA2IkGzenb4iMi6xoyvmHUtR9X1',
        'Building a React Native App',
        15),
    'PLjOEb1zLtYsyjB47Cm9RbCb9r-FoJ5Ju8': Playlist(
        'PLjOEb1zLtYsyjB47Cm9RbCb9r-FoJ5Ju8',
        'Building a React Native App',
        15),
  };
}
