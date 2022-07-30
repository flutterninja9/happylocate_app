import 'package:happylocate_app/core/entity/entity.dart';

abstract class Model<D, E extends Entity> {
  D fromDomain(E entity);
  E toDomain();
  D fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
