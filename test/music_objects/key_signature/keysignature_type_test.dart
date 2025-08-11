import 'package:flutter_test/flutter_test.dart';
import 'package:simple_sheet_music/simple_sheet_music.dart';
import 'package:simple_sheet_music/src/glyph.dart';

void main() {
  test(
      'keySignaturePositions(clefType) correctly returns the key positions for D major when a treble clef (clefType) is used',
      () {
    // Arrange
    const keySignatureType = KeySignatureType.dMajor;
    const clefType = ClefType.treble;
    // Act
    final keySignaturePositions =
        keySignatureType.keySignaturePositions(clefType);
    // Assert
    expect(keySignaturePositions.length, 2);
    expect(keySignaturePositions, [4, 1]);
  });
  test(
      'keySignaturePositions(clefType) correctly returns the key positions for B flat minor when a treble clef (clefType) is used',
      () {
    // Arrange
    const keySignatureType = KeySignatureType.bFlatMinor;
    const clefType = ClefType.bass;
    // Act
    final keySignaturePositions =
        keySignatureType.keySignaturePositions(clefType);
    // Assert
    expect(keySignaturePositions.length, 5);
    expect(keySignaturePositions, [-2, 1, -3, 0, -4]);
  });
  test(
      'keySignaturePositions(clefType) correctly returns blank key positions when a C major key signature is used',
      () {
    // Arrange
    const keySignatureType = KeySignatureType.cMajor;
    const clefType = ClefType.bass;
    // Act
    final keySignaturePositions =
        keySignatureType.keySignaturePositions(clefType);
    // Assert
    expect(keySignaturePositions.length, 0);
  });
  test(
      'hasParts returns true for key signatures other than C major and A minor',
      () {
    // Arrange
    final keySignatureTypes = KeySignatureType.values.where(
      (keySignatureType) =>
          keySignatureType != KeySignatureType.cMajor &&
          keySignatureType != KeySignatureType.aMinor,
    );

    for (final keySignatureType in keySignatureTypes) {
      // Act
      final hasParts = keySignatureType.hasParts;
      // Assert
      expect(hasParts, true);
    }
  });

  test('hasParts returns false for C major key signature', () {
    // Arrange
    const keySignatureType = KeySignatureType.cMajor;
    // Act
    final hasParts = keySignatureType.hasParts;
    // Assert
    expect(hasParts, false);
  });

  test('hasParts returns false for A minor key signature', () {
    // Arrange
    const keySignatureType = KeySignatureType.aMinor;
    // Act
    final hasParts = keySignatureType.hasParts;
    // Assert
    expect(hasParts, false);
  });

  test('Major key signatures', () {
    const cMajor = KeySignatureType.cMajor;
    const gMajor = KeySignatureType.gMajor;
    const dMajor = KeySignatureType.dMajor;
    const aMajor = KeySignatureType.aMajor;
    const eMajor = KeySignatureType.eMajor;
    const bMajor = KeySignatureType.bMajor;
    const fSharpMajor = KeySignatureType.fSharpMajor;
    const cSharpMajor = KeySignatureType.cSharpMajor;
    const fMajor = KeySignatureType.fMajor;
    const bFlatMajor = KeySignatureType.bFlatMajor;
    const eFlatMajor = KeySignatureType.eFlatMajor;
    const aFlatMajor = KeySignatureType.aFlatMajor;
    const dFlatMajor = KeySignatureType.dFlatMajor;
    const gFlatMajor = KeySignatureType.gFlatMajor;
    const cFlatMajor = KeySignatureType.cFlatMajor;

    expect(cMajor.isMinor, false);
    expect(cMajor.isMajor, true);
    expect(gMajor.isMinor, false);
    expect(gMajor.isMajor, true);
    expect(dMajor.isMinor, false);
    expect(dMajor.isMajor, true);
    expect(aMajor.isMinor, false);
    expect(aMajor.isMajor, true);
    expect(eMajor.isMinor, false);
    expect(eMajor.isMajor, true);
    expect(bMajor.isMinor, false);
    expect(bMajor.isMajor, true);
    expect(fSharpMajor.isMinor, false);
    expect(fSharpMajor.isMajor, true);
    expect(cSharpMajor.isMinor, false);
    expect(cSharpMajor.isMajor, true);
    expect(fMajor.isMinor, false);
    expect(fMajor.isMajor, true);
    expect(bFlatMajor.isMinor, false);
    expect(bFlatMajor.isMajor, true);
    expect(eFlatMajor.isMinor, false);
    expect(eFlatMajor.isMajor, true);
    expect(aFlatMajor.isMinor, false);
    expect(aFlatMajor.isMajor, true);
    expect(dFlatMajor.isMinor, false);
    expect(dFlatMajor.isMajor, true);
    expect(gFlatMajor.isMinor, false);
    expect(gFlatMajor.isMajor, true);
    expect(cFlatMajor.isMinor, false);
    expect(cFlatMajor.isMajor, true);
  });
  test('Minor key signatures', () {
    const aMinor = KeySignatureType.aMinor;
    const eMinor = KeySignatureType.eMinor;
    const bMinor = KeySignatureType.bMinor;
    const fSharpMinor = KeySignatureType.fSharpMinor;
    const cSharpMinor = KeySignatureType.cSharpMinor;
    const gSharpMinor = KeySignatureType.gSharpMinor;
    const dSharpMinor = KeySignatureType.dSharpMinor;
    const aSharpMinor = KeySignatureType.aSharpMinor;
    const dMinor = KeySignatureType.dMinor;
    const gMinor = KeySignatureType.gMinor;
    const cMinor = KeySignatureType.cMinor;
    const fMinor = KeySignatureType.fMinor;
    const bFlatMinor = KeySignatureType.bFlatMinor;
    const eFlatMinor = KeySignatureType.eFlatMinor;
    const aFlatMinor = KeySignatureType.aFlatMinor;

    expect(aMinor.isMajor, false);
    expect(aMinor.isMinor, true);
    expect(eMinor.isMajor, false);
    expect(eMinor.isMinor, true);
    expect(bMinor.isMajor, false);
    expect(bMinor.isMinor, true);
    expect(fSharpMinor.isMajor, false);
    expect(fSharpMinor.isMinor, true);
    expect(cSharpMinor.isMajor, false);
    expect(cSharpMinor.isMinor, true);
    expect(gSharpMinor.isMajor, false);
    expect(gSharpMinor.isMinor, true);
    expect(dSharpMinor.isMajor, false);
    expect(dSharpMinor.isMinor, true);
    expect(aSharpMinor.isMajor, false);
    expect(aSharpMinor.isMinor, true);
    expect(dMinor.isMajor, false);
    expect(dMinor.isMinor, true);
    expect(gMinor.isMajor, false);
    expect(gMinor.isMinor, true);
    expect(cMinor.isMajor, false);
    expect(cMinor.isMinor, true);
    expect(fMinor.isMajor, false);
    expect(fMinor.isMinor, true);
    expect(bFlatMinor.isMajor, false);
    expect(bFlatMinor.isMinor, true);
    expect(eFlatMinor.isMajor, false);
    expect(eFlatMinor.isMinor, true);
    expect(aFlatMinor.isMajor, false);
    expect(aFlatMinor.isMinor, true);
  });

  test('Key signatures with no associated glyphs', () {
    const cMajor = KeySignatureType.cMajor;
    const aMinor = KeySignatureType.aMinor;

    expect(cMajor.glyphUsed, Glyph.none);
    expect(aMinor.glyphUsed, Glyph.none);
  });
  test('Key signatures using sharps', () {
    const gMajor = KeySignatureType.gMajor;
    const eMinor = KeySignatureType.eMinor;
    const dMajor = KeySignatureType.dMajor;
    const bMinor = KeySignatureType.bMinor;
    const aMajor = KeySignatureType.aMajor;
    const fSharpMinor = KeySignatureType.fSharpMinor;
    const eMajor = KeySignatureType.eMajor;
    const cSharpMinor = KeySignatureType.cSharpMinor;
    const bMajor = KeySignatureType.bMajor;
    const gSharpMinor = KeySignatureType.gSharpMinor;
    const fSharpMajor = KeySignatureType.fSharpMajor;
    const dSharpMinor = KeySignatureType.dSharpMinor;
    const cSharpMajor = KeySignatureType.cSharpMajor;
    const aSharpMinor = KeySignatureType.aSharpMinor;

    expect(gMajor.glyphUsed, Glyph.sharp);
    expect(eMinor.glyphUsed, Glyph.sharp);
    expect(dMajor.glyphUsed, Glyph.sharp);
    expect(bMinor.glyphUsed, Glyph.sharp);
    expect(aMajor.glyphUsed, Glyph.sharp);
    expect(fSharpMinor.glyphUsed, Glyph.sharp);
    expect(eMajor.glyphUsed, Glyph.sharp);
    expect(cSharpMinor.glyphUsed, Glyph.sharp);
    expect(bMajor.glyphUsed, Glyph.sharp);
    expect(gSharpMinor.glyphUsed, Glyph.sharp);
    expect(fSharpMajor.glyphUsed, Glyph.sharp);
    expect(dSharpMinor.glyphUsed, Glyph.sharp);
    expect(cSharpMajor.glyphUsed, Glyph.sharp);
    expect(aSharpMinor.glyphUsed, Glyph.sharp);
  });

  test('Key signatures using flats', () {
    const fMajor = KeySignatureType.fMajor;
    const dMinor = KeySignatureType.dMinor;
    const bFlatMajor = KeySignatureType.bFlatMajor;
    const gMinor = KeySignatureType.gMinor;
    const eFlatMajor = KeySignatureType.eFlatMajor;
    const cMinor = KeySignatureType.cMinor;
    const aFlatMajor = KeySignatureType.aFlatMajor;
    const fMinor = KeySignatureType.fMinor;
    const dFlatMajor = KeySignatureType.dFlatMajor;
    const bFlatMinor = KeySignatureType.bFlatMinor;
    const gFlatMajor = KeySignatureType.gFlatMajor;
    const eFlatMinor = KeySignatureType.eFlatMinor;
    const cFlatMajor = KeySignatureType.cFlatMajor;
    const aFlatMinor = KeySignatureType.aFlatMinor;

    expect(fMajor.glyphUsed, Glyph.flat);
    expect(dMinor.glyphUsed, Glyph.flat);
    expect(bFlatMajor.glyphUsed, Glyph.flat);
    expect(gMinor.glyphUsed, Glyph.flat);
    expect(eFlatMajor.glyphUsed, Glyph.flat);
    expect(cMinor.glyphUsed, Glyph.flat);
    expect(aFlatMajor.glyphUsed, Glyph.flat);
    expect(fMinor.glyphUsed, Glyph.flat);
    expect(dFlatMajor.glyphUsed, Glyph.flat);
    expect(bFlatMinor.glyphUsed, Glyph.flat);
    expect(gFlatMajor.glyphUsed, Glyph.flat);
    expect(eFlatMinor.glyphUsed, Glyph.flat);
    expect(cFlatMajor.glyphUsed, Glyph.flat);
    expect(aFlatMinor.glyphUsed, Glyph.flat);
  });
}
