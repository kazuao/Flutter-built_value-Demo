library built_vehicle; // Library化？

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'built_vehicle.g.dart';

abstract class BuiltVehicle
    implements Built<BuiltVehicle, BuiltVehicleBuilder> {
  VehicleType get type; // enumを使う
  String get brand;
  double get price;
  // @nullable // null許容の場合つける // <- Optionalになった
  bool? get someNullableValue;
  BuiltList<String> get passengerNames;

// 必ず書く
  BuiltVehicle._();

  factory BuiltVehicle([update(BuiltVehicleBuilder b)]) = _$BuiltVehicle;

  // toJson
  String toJson() {
    return json
        .encode(serializers.serializeWith(BuiltVehicle.serializer, this));
  }

  // fromJson
  static BuiltVehicle fromJson(String jsonString) {
    return serializers.deserializeWith(
        BuiltVehicle.serializer, json.decode(jsonString))!;
  }

  // Serializerを使用するために追加する
  static Serializer<BuiltVehicle> get serializer => _$builtVehicleSerializer;
}

class VehicleType extends EnumClass {
  static const VehicleType car = _$car;
  static const VehicleType motorbike = _$motorbike;
  static const VehicleType train = _$train;
  static const VehicleType plane = _$plane;

  const VehicleType._(String name) : super(name);

  static BuiltSet<VehicleType> get values => _$values;
  static VehicleType valueOf(String name) => _$valueOf(name);

  // Serializerするためには、enumClassにも追加する必要がある
  static Serializer<VehicleType> get serializer => _$vehicleTypeSerializer;
}
