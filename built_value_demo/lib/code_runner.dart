import 'package:built_value_demo/models/built_vehicle.dart';

class CodeRunner {
  static void runCode() {
    // インスタンス生成
    var car = BuiltVehicle((b) => b
      ..type = VehicleType.car
      ..brand = 'tesla'
      ..price = 100000
      ..passengerNames.addAll(['John', 'Sophia', 'Dave', 'Linda']));

    // もとのインスタンスをもとに新しいものを作成
    var copiedCar = car.rebuild((b) => b..brand = 'BMW');
    var copiedTrain = car.rebuild((b) => b..type = VehicleType.train);

    print(car);
    print(copiedCar);
    print(copiedTrain);

    final carJson = car.toJson();
    print(carJson);

    final carFromJson =
        BuiltVehicle.fromJson(carJson).rebuild((b) => b..price = 20000);
    print(carFromJson);
  }
}
