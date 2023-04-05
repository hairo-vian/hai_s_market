import 'dart:io';

import 'package:hai_market/database/sample/sample.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class Boxes {
  static Box<Sample> getSamples() => Hive.box<Sample>(Sample.TABLE_NAME);
}

initDatabase() async {
  if (kIsWeb) {
    Hive.initFlutter();
  } else {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
  }

  Hive.registerAdapter(SampleAdapter());

  await Hive.openBox<Sample>(Sample.TABLE_NAME);
}
