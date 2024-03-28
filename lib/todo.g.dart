// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class todoAdapter extends TypeAdapter<todo> {
  @override
  final int typeId = 1;

  @override
  todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return todo(
      title: fields[0] as String,
      iscomepleted: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, todo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.iscomepleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is todoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
