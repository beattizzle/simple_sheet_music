import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_sheet_music/src/glyph_metadata.dart';
import 'package:simple_sheet_music/src/glyph_path.dart';
import 'package:simple_sheet_music/src/measure/measure.dart';
import 'package:simple_sheet_music/src/music_objects/clef/clef_type.dart';
import 'package:simple_sheet_music/src/sheet_music_renderer.dart';
import 'package:xml/xml.dart';

import 'font_types.dart';
import 'music_objects/interface/musical_symbol.dart';
import 'sheet_music_layout.dart';

typedef OnTapMusicObjectCallback = void Function(
  MusicalSymbol musicObject,
  Offset offset,
);

/// The `SimpleSheetMusic` widget is used to display sheet music.
/// It takes a list of `Staff` objects, an initial clef, and other optional parameters to customize the appearance of the sheet music.
class SimpleSheetMusic extends StatefulWidget {
  const SimpleSheetMusic({
    super.key,
    required this.measures,
    this.initialClefType = ClefType.treble,
    this.maximumHeight = 400.0,
    this.maximumWidth = 400.0,
    this.onTap,
    this.lineColor = Colors.black54,
    this.fontType = FontType.bravura,
  });

  /// The list of measures to be displayed.
  final List<Measure> measures;

  /// Receive maximum width and height so as not to break the aspect ratio of the score.
  final double maximumHeight;

  /// Receive maximum width and height so as not to break the aspect ratio of the score.
  final double maximumWidth;

  /// The font type to be used for rendering the sheet music.
  final FontType fontType;

  /// The initial clef  for the sheet music.
  final ClefType initialClefType;

  // / The initial keySignature for the sheet music.
  // final KeySignature initialKeySignature;

  /// A callback function that is called when a music object is tapped.
  final OnTapMusicObjectCallback? onTap;

  final Color lineColor;

  @override
  SimpleSheetMusicState createState() => SimpleSheetMusicState();
}

/// The state class for the SimpleSheetMusic widget.
///
/// This class manages the state of the SimpleSheetMusic widget and handles the initialization,
/// font asset loading, and building of the widget.
class SimpleSheetMusicState extends State<SimpleSheetMusic> {
  // late final AsyncMemoizer memoizer;
  // late final SheetMusicLayout layout;
  // late final SheetMusicRenderer renderer;
  // late SheetMusicBuilder staffsBuilder;

  late final GlyphPaths glyphPath;
  late final GlyphMetadata metadata;

  FontType get fontType => widget.fontType;

  @override
  void initState() {
    super.initState();
  }

  Future<void> load() async {
    final xml = await rootBundle.loadString(fontType.svgPath);
    final document = XmlDocument.parse(xml);
    final allGlyphs = document.findAllElements('glyph').toSet();
    glyphPath = GlyphPaths(allGlyphs);
    final json = await rootBundle.loadString(fontType.metadataPath);
    metadata = GlyphMetadata(jsonDecode(json) as Map<String, dynamic>);
  }

  @override
  Widget build(BuildContext context) {
    final targetSize = Size(widget.maximumWidth, widget.maximumHeight);
    return FutureBuilder(
      future: load(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        final layout = SheetMusicLayout(
          widget.measures,
          metadata,
          glyphPath,
          widget.lineColor,
          maximumWidth: widget.maximumWidth,
          maximumHeight: widget.maximumHeight,
        );
        return GestureDetector(
          onTap: () {
            print('Tapped');
          },
          child: CustomPaint(
            size: targetSize,
            painter: SheetMusicRenderer(layout),
          ),
        );
      },
    );
  }
}
