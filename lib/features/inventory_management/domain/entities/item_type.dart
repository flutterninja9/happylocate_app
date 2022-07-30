enum ItemType { heavy, fragile }

ItemType itemTypeFromString(String value) {
  switch (value) {
    case 'heavy':
      return ItemType.heavy;
    case 'fragile':
      return ItemType.fragile;
    default:
      throw Exception('Unknown item type: $value');
  }
}
