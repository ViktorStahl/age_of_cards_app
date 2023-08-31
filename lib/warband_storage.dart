import 'dart:convert';
import 'dart:io';
import 'package:age_of_cards_app/models/warband_container.dart';
import 'package:path_provider/path_provider.dart';

class WarbandStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<WarbandContainer> readWarbands() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      Map<String, dynamic> jsonData = jsonDecode(contents);

      return WarbandContainer.fromJson(jsonData);
    } catch (e) {
      // If encountering an error, return empty WarbandContainer.
      return WarbandContainer();
    }
  }

  Future<File> writeWarbands(WarbandContainer warbands) async {
    final file = await _localFile;

    String jsonString = jsonEncode(warbands.toJson());

    // Write the file
    return file.writeAsString(jsonString);
  }
}