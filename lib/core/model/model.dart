import 'package:happylocate_app/core/entity/entity.dart';

abstract class Model<E extends Entity> {
  E toDomain();
  Map<String, dynamic> toJson();
}
