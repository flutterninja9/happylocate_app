import 'package:happylocate_app/core/entity/entity.dart';

/// Defaults to ft
class Dimension extends Entity {
  final num height;
  final num width;

  factory Dimension.zero() {
    return Dimension(height: 0, width: 0);
  }

  Dimension({
    required this.height,
    required this.width,
  });

  @override
  String toString() => '$height Feet X $width Feet';

  Dimension copyWith({
    num? height,
    num? width,
  }) {
    return Dimension(
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }
}
