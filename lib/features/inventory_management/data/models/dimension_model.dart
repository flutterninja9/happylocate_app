import 'package:happylocate_app/core/model/model.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/dimesion.dart';

class DimensionModel extends Model<Dimension> {
  final num? height;
  final num? width;

  DimensionModel(this.height, this.width);

  factory DimensionModel.fromDomain(Dimension entity) {
    return DimensionModel(entity.height, entity.width);
  }

  factory DimensionModel.fromJson(Map<String, dynamic> json) {
    return DimensionModel(
      json['height'] as num?,
      json['width'] as num?,
    );
  }

  @override
  Dimension toDomain() {
    return Dimension(
      width: width ?? 0.0,
      height: height ?? 0.0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'width': width,
    };
  }
}
