import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<String> readText() async {
    try {
      final file = await _localFile;
      // Read the file
      return await file.readAsString();
    } catch (e) {
      // If encountering an error, return 0
      return "Contents of the textfield";
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$counter');
  }

  Future<File> writeText(String text) async {
    final file = await _localFile;
    // Write the file
    print("some $text");
    return file.writeAsString('$text');
  }
}
