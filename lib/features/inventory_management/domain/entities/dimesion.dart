import 'package:happylocate_app/core/entity/entity.dart';

/// Defaults to ft
class Dimension extends Entity {
  final num height;
  final num width;

  Dimension({
    required this.height,
    required this.width,
  });

  @override
  String toString() => '$height Feet X $width Feet';
}
