import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/view/page/task/task.dart';

  Future<Isar> openIsar() async {
    final dir = await getApplicationSupportDirectory();
   final isar = await Isar.open([
      TaskSchema,
    ], directory: dir.path);
    return isar;
  }