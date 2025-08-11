import 'package:simple_sheet_music/src/glyph.dart';
import 'package:simple_sheet_music/src/music_objects/clef/clef_type.dart';
import 'package:simple_sheet_music/src/music_objects/key_signature/major_minor.dart';

/// Represents the type of a key signature.
enum KeySignatureType {
  cMajor(0, '', 'C Major', MajorMinor.major, Glyph.none),
  aMinor(0, '', 'A Minor', MajorMinor.minor, Glyph.none),
  gMajor(1, _sharpKey, 'G Major', MajorMinor.major, Glyph.sharp),
  eMinor(1, _sharpKey, 'E Minor', MajorMinor.minor, Glyph.sharp),
  dMajor(2, _sharpKey, 'D Major', MajorMinor.major, Glyph.sharp),
  bMinor(2, _sharpKey, 'B Minor', MajorMinor.minor, Glyph.sharp),
  aMajor(3, _sharpKey, 'A Major', MajorMinor.major, Glyph.sharp),
  fSharpMinor(3, _sharpKey, 'F Sharp Minor', MajorMinor.minor, Glyph.sharp),
  eMajor(4, _sharpKey, 'E Major', MajorMinor.major, Glyph.sharp),
  cSharpMinor(4, _sharpKey, 'C Sharp Minor', MajorMinor.minor, Glyph.sharp),
  bMajor(5, _sharpKey, 'B Major', MajorMinor.major, Glyph.sharp),
  gSharpMinor(5, _sharpKey, 'G Sharp Minor', MajorMinor.minor, Glyph.sharp),
  fSharpMajor(6, _sharpKey, 'F Sharp Major', MajorMinor.major, Glyph.sharp),
  dSharpMinor(6, _sharpKey, 'D Sharp Minor', MajorMinor.minor, Glyph.sharp),
  cSharpMajor(7, _sharpKey, 'C Sharp Major', MajorMinor.major, Glyph.sharp),
  aSharpMinor(7, _sharpKey, 'A Sharp Minor', MajorMinor.minor, Glyph.sharp),

  fMajor(1, _flatKey, 'F Major', MajorMinor.major, Glyph.flat),
  dMinor(1, _flatKey, 'D Minor', MajorMinor.minor, Glyph.flat),
  bFlatMajor(2, _flatKey, 'B Flat Major', MajorMinor.major, Glyph.flat),
  gMinor(2, _flatKey, 'G Minor', MajorMinor.minor, Glyph.flat),
  eFlatMajor(3, _flatKey, 'E Flat Major', MajorMinor.major, Glyph.flat),
  cMinor(3, _flatKey, 'C Minor', MajorMinor.minor, Glyph.flat),
  aFlatMajor(4, _flatKey, 'A Flat Major', MajorMinor.major, Glyph.flat),
  fMinor(4, _flatKey, 'F Minor', MajorMinor.minor, Glyph.flat),
  dFlatMajor(5, _flatKey, 'D Flat Major', MajorMinor.major, Glyph.flat),
  bFlatMinor(5, _flatKey, 'B Flat Minor', MajorMinor.minor, Glyph.flat),
  gFlatMajor(6, _flatKey, 'G Flat Major', MajorMinor.major, Glyph.flat),
  eFlatMinor(6, _flatKey, 'E Flat Minor', MajorMinor.minor, Glyph.flat),
  cFlatMajor(7, _flatKey, 'C Flat Major', MajorMinor.major, Glyph.flat),
  aFlatMinor(7, _flatKey, 'A Flat Minor', MajorMinor.minor, Glyph.flat);

  /// Creates a [KeySignatureType] instance.
  ///
  /// The [keyNum] represents the number of keys in the key signature.
  /// The [pathKey] is the path of the key symbol.
  /// The [name] is the name of the key signature.
  /// The [glyphUsed] indicates whether the key signature uses sharps or flats.
  const KeySignatureType(
    this.keyNum,
    this.pathKey,
    this.name,
    this._majorMinor,
    this.glyphUsed,
  );

  /// The number of keys in the key signature.
  final int keyNum;

  /// The path of the key symbol.
  final String pathKey;

  /// The name of the key signature.
  final String name;

  /// Indicates whether the key signature is a major or minor key.
  final MajorMinor _majorMinor;

  /// Indicates whether the key signature uses sharps or flats.
  final Glyph glyphUsed;

  static const _flatKey = 'uniE260';
  static const _sharpKey = 'uniE262';

  /// Returns the default offset space for the key signature.
  int get defaultOffsetSpace => glyphUsed == Glyph.sharp ? 1 : 0;

  /// Returns whether the key signature has parts.
  bool get hasParts =>
      this != KeySignatureType.cMajor && this != KeySignatureType.aMinor;

  /// Returns whether the key signature is a major key.
  bool get isMajor => _majorMinor == MajorMinor.major;

  /// Returns whether the key signature is a minor key.
  bool get isMinor => _majorMinor == MajorMinor.minor;

  /// Returns the positions of the key signature on the staff for the given [clefType].
  List<int> keySignaturePositions(ClefType clefType) => glyphUsed == Glyph.sharp
      ? clefType.sharpKeySignaturePositions.sublist(0, keyNum)
      : clefType.flatKeySignaturePositions.sublist(0, keyNum);
}
