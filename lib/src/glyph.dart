enum Glyph {
  none(''),
  flat('uniE260'),
  natural('uniE261'),
  sharp('uniE262'),
  doubleSharp('uniE263'),
  doubleFlat('uniE264');

  const Glyph(this.unicode);
  final String unicode;
}
