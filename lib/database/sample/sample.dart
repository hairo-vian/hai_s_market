import 'package:hive/hive.dart';

part 'sample.g.dart';

@HiveType(typeId: 0)
class Sample {
  static const String TABLE_NAME = "sample";
  @HiveField(0)
  String? sampleId;

  @HiveField(1)
  String? sample;
}
