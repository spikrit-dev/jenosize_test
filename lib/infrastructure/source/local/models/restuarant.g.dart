// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restuarant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RestuarantHiveModelAdapter extends TypeAdapter<RestuarantHiveModel> {
  @override
  final int typeId = 1;

  @override
  RestuarantHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestuarantHiveModel()
      ..rank = fields[0] as String
      ..restaurant = fields[1] as String
      ..content = fields[2] as String
      ..sales = fields[3] as String
      ..units = fields[4] as String
      ..segmentCategory = fields[5] as String
      ..imageUrl = fields[6] as String
      ..yOYSales = fields[7] as String
      ..yOYUnits = fields[8] as String
      ..headquarters = fields[9] as String;
  }

  @override
  void write(BinaryWriter writer, RestuarantHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.rank)
      ..writeByte(1)
      ..write(obj.restaurant)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.sales)
      ..writeByte(4)
      ..write(obj.units)
      ..writeByte(5)
      ..write(obj.segmentCategory)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.yOYSales)
      ..writeByte(8)
      ..write(obj.yOYUnits)
      ..writeByte(9)
      ..write(obj.headquarters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestuarantHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
