// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SampleAdapter extends TypeAdapter<Sample> {
  @override
  final int typeId = 0;

  @override
  Sample read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sample()
      ..sampleId = fields[0] as String?
      ..sample = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, Sample obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.sampleId)
      ..writeByte(1)
      ..write(obj.sample);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SampleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
