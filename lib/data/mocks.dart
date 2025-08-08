import 'dart:math';

const _placeholdBaseUrl = 'https://placehold.co';
const _thumbnailSize = 200;
const _originalSize = 600;

abstract final class Mocks {
  static (String, String) get randomPhoto {
    final randomForegroundColor = _randomColor;
    final randomBackgroundColor = _randomColor;
    final thumbnail =
        '$_placeholdBaseUrl/$_thumbnailSize/$randomBackgroundColor/$randomForegroundColor/png';
    final original =
        '$_placeholdBaseUrl/$_originalSize/$randomBackgroundColor/$randomForegroundColor/png';

    return (thumbnail, original);
  }

  static String get _randomColor {
    final rand = Random().nextDouble() * 0xFFFFFF;
    return rand.toInt().toRadixString(16);
  }
}
