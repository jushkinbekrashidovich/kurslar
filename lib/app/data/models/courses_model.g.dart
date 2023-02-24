// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************
class CoursesModelAdapter extends TypeAdapter<CoursesModel> {
  @override
  final int typeId = 0;

  @override
  CoursesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoursesModel(
      post_id: fields[0] as String?,
      image_url: fields[1] as String?,
      school_name: fields[2] as String?,
      address: fields[3] as String?,
      latitude_location: fields[4] as String?,
      longtitude_location: fields[5] as String?,
      phone_number: fields[6] as String?,
      description: fields[7] as String?,
      telegram_link: fields[8] as String?,
      instagram_link: fields[9] as String?,
      website_link: fields[10] as String?,
      facebook_link: fields[11] as String?,
      subjects: (fields[12] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CoursesModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.post_id)
      ..writeByte(1)
      ..write(obj.image_url)
      ..writeByte(2)
      ..write(obj.school_name)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.latitude_location)
      ..writeByte(5)
      ..write(obj.longtitude_location)
      ..writeByte(6)
      ..write(obj.phone_number)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.telegram_link)
      ..writeByte(9)
      ..write(obj.instagram_link)
      ..writeByte(10)
      ..write(obj.website_link)
      ..writeByte(11)
      ..write(obj.facebook_link)
      ..writeByte(12)
      ..write(obj.subjects);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoursesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
