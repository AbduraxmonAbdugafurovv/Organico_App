// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAdapter extends TypeAdapter<Model> {
  @override
  final int typeId = 1;

  @override
  Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model(
      wishlist: fields[8] as bool,
      count: fields[0] as int,
      img: fields[1] as String,
      name: fields[2] as String,
      shop: fields[3] as String,
      price: fields[4] as String,
      details: fields[5] as String,
      timeDelivery: fields[7] as String,
      category: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Model obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.img)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.shop)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.details)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.timeDelivery)
      ..writeByte(8)
      ..write(obj.wishlist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
