import 'package:simple_sheet_music/src/glyph.dart';
import 'package:simple_sheet_music/src/music_objects/clef/clef_type.dart';
import 'package:simple_sheet_music/src/music_objects/key_signature/major_minor.dart';

/// Represents the type of a key signature.
enum KeySignatureType {
  cMajor(0, 'C Major', MajorMinor.major, Glyph.none),
  aMinor(0, 'A Minor', MajorMinor.minor, Glyph.none),
  gMajor(1, 'G Major', MajorMinor.major, Glyph.sharp),
  eMinor(1, 'E Minor', MajorMinor.minor, Glyph.sharp),
  dMajor(2, 'D Major', MajorMinor.major, Glyph.sharp),
  bMinor(2, 'B Minor', MajorMinor.minor, Glyph.sharp),
  aMajor(3, 'A Major', MajorMinor.major, Glyph.sharp),
  fSharpMinor(3, 'F Sharp Minor', MajorMinor.minor, Glyph.sharp),
  eMajor(4, 'E Major', MajorMinor.major, Glyph.sharp),
  cSharpMinor(4, 'C Sharp Minor', MajorMinor.minor, Glyph.sharp),
  bMajor(5, 'B Major', MajorMinor.major, Glyph.sharp),
  gSharpMinor(5, 'G Sharp Minor', MajorMinor.minor, Glyph.sharp),
  fSharpMajor(6, 'F Sharp Major', MajorMinor.major, Glyph.sharp),
  dSharpMinor(6, 'D Sharp Minor', MajorMinor.minor, Glyph.sharp),
  cSharpMajor(7, 'C Sharp Major', MajorMinor.major, Glyph.sharp),
  aSharpMinor(7, 'A Sharp Minor', MajorMinor.minor, Glyph.sharp),

  fMajor(1, 'F Major', MajorMinor.major, Glyph.flat),
  dMinor(1, 'D Minor', MajorMinor.minor, Glyph.flat),
  bFlatMajor(2, 'B Flat Major', MajorMinor.major, Glyph.flat),
  gMinor(2, 'G Minor', MajorMinor.minor, Glyph.flat),
  eFlatMajor(3, 'E Flat Major', MajorMinor.major, Glyph.flat),
  cMinor(3, 'C Minor', MajorMinor.minor, Glyph.flat),
  aFlatMajor(4, 'A Flat Major', MajorMinor.major, Glyph.flat),
  fMinor(4, 'F Minor', MajorMinor.minor, Glyph.flat),
  dFlatMajor(5, 'D Flat Major', MajorMinor.major, Glyph.flat),
  bFlatMinor(5, 'B Flat Minor', MajorMinor.minor, Glyph.flat),
  gFlatMajor(6, 'G Flat Major', MajorMinor.major, Glyph.flat),
  eFlatMinor(6, 'E Flat Minor', MajorMinor.minor, Glyph.flat),
  cFlatMajor(7, 'C Flat Major', MajorMinor.major, Glyph.flat),
  aFlatMinor(7, 'A Flat Minor', MajorMinor.minor, Glyph.flat);

  /// Creates a [KeySignatureType] instance.
  ///
  /// The [keyNum] represents the number of keys in the key signature.
  /// The [name] is the name of the key signature.
  /// The [glyphUsed] indicates whether the key signature uses sharps or flats.
  const KeySignatureType(
    this.keyNum,
    this.name,
    this.majorMinor,
    this.glyphUsed,
  );

  /// The number of keys in the key signature.
  final int keyNum;

  /// The name of the key signature.
  final String name;

  /// Indicates whether the key signature is a major or minor key.
  final MajorMinor majorMinor;

  /// Indicates whether the key signature uses sharps or flats.
  final Glyph glyphUsed;

  /// Returns the default offset space for the key signature.
  int get defaultOffsetSpace => glyphUsed == Glyph.sharp ? 1 : 0;

  /// Returns the path for the key signature glyph.
  String get pathKey => glyphUsed.unicode;

  /// Returns whether the key signature has parts.
  bool get hasParts =>
      this != KeySignatureType.cMajor && this != KeySignatureType.aMinor;

  /// Returns whether the key signature is a major key.
  bool get isMajor => majorMinor == MajorMinor.major;

  /// Returns whether the key signature is a minor key.
  bool get isMinor => majorMinor == MajorMinor.minor;

  /// Returns the previously defined isSharp
  bool get isSharp => glyphUsed == Glyph.sharp;

  /// Returns the previously defined isFlat property.
  bool get isFlat => glyphUsed == Glyph.flat;

  /// Returns the positions of the key signature on the staff for the given [clefType].
  List<int> keySignaturePositions(ClefType clefType) => glyphUsed == Glyph.sharp
      ? clefType.sharpKeySignaturePositions.sublist(0, keyNum)
      : clefType.flatKeySignaturePositions.sublist(0, keyNum);
}
